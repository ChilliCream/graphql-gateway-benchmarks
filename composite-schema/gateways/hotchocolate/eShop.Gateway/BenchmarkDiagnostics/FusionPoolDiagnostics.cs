using System.Collections;
using System.Diagnostics.Tracing;
using System.Globalization;
using System.Text;

namespace eShop.Gateway.BenchmarkDiagnostics;

internal sealed class FusionPoolDiagnostics(IHostEnvironment environment) : EventListener, IHostedService
{
    private const string FixedSizeArrayPoolSource = "HotChocolate-Buffers-FixedSizeArrayPool";
    private const string PathSegmentPoolSource = "HotChocolate-Fusion-PathSegmentPool";
    private const string ResultStorePoolSource = "HotChocolate-Fusion-FetchResultStorePool";
    private const int CounterIntervalSeconds = 2;
    private static readonly TimeSpan SnapshotInterval = TimeSpan.FromSeconds(3);

    private readonly Lock _writeLock = new();
    private readonly Lock _stateLock = new();
    private readonly PoolState _fixedPool = new("fixed");
    private readonly PoolState _pathPool = new("path");
    private readonly PoolState _resultPool = new("result_store");

    private StreamWriter? _writer;
    private CancellationTokenSource? _snapshotCts;
    private Task? _snapshotTask;
    private long _unhandledExceptionCount;
    private long _unobservedTaskExceptionCount;

    // Buffer events received before StartAsync initializes the writer.
    private readonly List<string> _pendingLines = [];

    public Task StartAsync(CancellationToken cancellationToken)
    {
        try
        {
            var diagnosticsDirectory = ResolveDiagnosticsDirectory();
            Directory.CreateDirectory(diagnosticsDirectory);
            var logPath = Path.Combine(diagnosticsDirectory, "fusion-diagnostics.log");
            _writer = new StreamWriter(
                new FileStream(logPath, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
            {
                AutoFlush = true
            };

            FlushPendingLines();

            WriteLine(
                $"kind=diagnostics-start pid={Environment.ProcessId} " +
                $"fixed_source={Quote(FixedSizeArrayPoolSource)} " +
                $"path_source={Quote(PathSegmentPoolSource)} " +
                $"result_source={Quote(ResultStorePoolSource)}");
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine($"[FusionPoolDiagnostics] StartAsync failed: {ex.Message}");
        }

        AppDomain.CurrentDomain.UnhandledException += OnUnhandledException;
        TaskScheduler.UnobservedTaskException += OnUnobservedTaskException;

        _snapshotCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
        _snapshotTask = Task.Run(() => SnapshotLoopAsync(_snapshotCts.Token), CancellationToken.None);

        return Task.CompletedTask;
    }

    public async Task StopAsync(CancellationToken cancellationToken)
    {
        TaskScheduler.UnobservedTaskException -= OnUnobservedTaskException;
        AppDomain.CurrentDomain.UnhandledException -= OnUnhandledException;

        if (_snapshotCts is not null)
        {
            await _snapshotCts.CancelAsync().ConfigureAwait(false);
        }

        if (_snapshotTask is not null)
        {
            try
            {
                await _snapshotTask.WaitAsync(cancellationToken).ConfigureAwait(false);
            }
            catch (OperationCanceledException)
            {
            }
        }

        WriteSnapshot();
        WriteLine("kind=diagnostics-stop");
        DisposeWriter();
    }

    protected override void OnEventSourceCreated(EventSource eventSource)
    {
        if (!IsTargetPoolSource(eventSource.Name))
        {
            return;
        }

        try
        {
            EnableEvents(
                eventSource,
                EventLevel.Informational,
                EventKeywords.None,
                new Dictionary<string, string?> { ["EventCounterIntervalSec"] = CounterIntervalSeconds.ToString(CultureInfo.InvariantCulture) });

            MarkSourceAttached(eventSource.Name);

            // OnEventSourceCreated fires at construction time, before StartAsync
            // initializes the writer. Buffer the line so it's flushed once ready.
            BufferOrWriteLine($"kind=eventsource-enabled source={Quote(eventSource.Name)}");
        }
        catch (Exception ex)
        {
            BufferOrWriteLine(
                $"kind=eventsource-enable-failed source={Quote(eventSource.Name)} " +
                $"error={Quote(ex.Message)}");
        }
    }

    protected override void OnEventWritten(EventWrittenEventArgs eventData)
    {
        var sourceName = eventData.EventSource.Name;
        if (!IsTargetPoolSource(sourceName))
        {
            return;
        }

        if (eventData.EventName is "EventCounters")
        {
            if (!TryReadCounter(eventData, out var counterName, out var value))
            {
                return;
            }

            UpdatePoolState(sourceName, counterName, value);
            WriteLine(
                $"kind=pool-counter source={Quote(sourceName)} " +
                $"counter={Quote(counterName)} value={value.ToString("0.###", CultureInfo.InvariantCulture)}");

            return;
        }

        if (eventData.Level >= EventLevel.Warning)
        {
            WriteLine(
                $"kind=pool-event source={Quote(sourceName)} " +
                $"event={Quote(eventData.EventName ?? eventData.EventId.ToString(CultureInfo.InvariantCulture))} " +
                $"level={eventData.Level}");
        }
    }

    private async Task SnapshotLoopAsync(CancellationToken cancellationToken)
    {
        try
        {
            WriteSnapshot();

            using var timer = new PeriodicTimer(SnapshotInterval);
            while (await timer.WaitForNextTickAsync(cancellationToken).ConfigureAwait(false))
            {
                WriteSnapshot();
            }
        }
        catch (OperationCanceledException) when (cancellationToken.IsCancellationRequested)
        {
        }
        catch (Exception ex) when (!cancellationToken.IsCancellationRequested)
        {
            Console.Error.WriteLine($"[FusionPoolDiagnostics] Snapshot loop failed: {ex.Message}");
        }
    }

    private void WriteSnapshot()
    {
        PoolSnapshot fixedSnapshot;
        PoolSnapshot pathSnapshot;
        PoolSnapshot resultSnapshot;

        lock (_stateLock)
        {
            fixedSnapshot = _fixedPool.Snapshot();
            pathSnapshot = _pathPool.Snapshot();
            resultSnapshot = _resultPool.Snapshot();
        }

        var unhandled = Interlocked.Read(ref _unhandledExceptionCount);
        var unobserved = Interlocked.Read(ref _unobservedTaskExceptionCount);

        var line = new StringBuilder(512);
        line.Append("kind=pool-snapshot");
        line.Append(" pid=").Append(Environment.ProcessId);
        AppendPoolSnapshot(line, "fixed", fixedSnapshot);
        AppendPoolSnapshot(line, "path", pathSnapshot);
        AppendPoolSnapshot(line, "result", resultSnapshot);
        line.Append(" app.unhandled=").Append(unhandled);
        line.Append(" app.unobserved_task=").Append(unobserved);

        WriteLine(line.ToString());
    }

    private static void AppendPoolSnapshot(StringBuilder line, string prefix, PoolSnapshot snapshot)
    {
        line.Append(' ').Append(prefix).Append(".attached=").Append(snapshot.Attached ? 1 : 0);
        line.Append(' ').Append(prefix).Append(".source=").Append(Quote(snapshot.SourceName));
        line.Append(' ').Append(prefix).Append(".rents=").Append(Format(snapshot.Rents));
        line.Append(' ').Append(prefix).Append(".returns=").Append(Format(snapshot.Returns));
        line.Append(' ').Append(prefix).Append(".outstanding=").Append(Format(snapshot.Outstanding));
        line.Append(' ').Append(prefix).Append(".exhausted=").Append(Format(snapshot.Exhausted));
        line.Append(' ').Append(prefix).Append(".allocated=").Append(Format(snapshot.Allocated));
        line.Append(' ').Append(prefix).Append(".dropped=").Append(Format(snapshot.Dropped));
        line.Append(' ').Append(prefix).Append(".trimmed=").Append(Format(snapshot.Trimmed));
    }

    private void OnUnhandledException(object? sender, UnhandledExceptionEventArgs args)
    {
        Interlocked.Increment(ref _unhandledExceptionCount);

        var exception = args.ExceptionObject as Exception;
        WriteLine(
            $"kind=appdomain-unhandled terminating={(args.IsTerminating ? 1 : 0)} " +
            $"type={Quote(exception?.GetType().FullName ?? args.ExceptionObject?.GetType().FullName ?? "unknown")} " +
            $"message={Quote(exception?.Message ?? args.ExceptionObject?.ToString() ?? "n/a")}");
    }

    private void OnUnobservedTaskException(object? sender, UnobservedTaskExceptionEventArgs args)
    {
        Interlocked.Increment(ref _unobservedTaskExceptionCount);

        var exception = args.Exception;
        WriteLine(
            $"kind=task-unobserved observed={(args.Observed ? 1 : 0)} " +
            $"type={Quote(exception.GetType().FullName)} message={Quote(exception.Message)}");
    }

    private void MarkSourceAttached(string sourceName)
    {
        lock (_stateLock)
        {
            GetPoolState(sourceName).Attached = true;
            GetPoolState(sourceName).SourceName = sourceName;
        }
    }

    private void UpdatePoolState(string sourceName, string counterName, double value)
    {
        lock (_stateLock)
        {
            var state = GetPoolState(sourceName);
            state.SourceName = sourceName;
            state.ApplyCounter(counterName, value);
        }
    }

    private PoolState GetPoolState(string sourceName)
    {
        if (IsFixedSizeArrayPoolSource(sourceName))
        {
            return _fixedPool;
        }

        if (IsPathSegmentPoolSource(sourceName))
        {
            return _pathPool;
        }

        return _resultPool;
    }

    private void BufferOrWriteLine(string line)
    {
        lock (_writeLock)
        {
            if (_writer is null)
            {
                _pendingLines.Add($"{DateTime.UtcNow.ToString("O", CultureInfo.InvariantCulture)} {line}");
                return;
            }
        }

        WriteLine(line);
    }

    private void FlushPendingLines()
    {
        lock (_writeLock)
        {
            if (_writer is null)
            {
                return;
            }

            foreach (var pending in _pendingLines)
            {
                try
                {
                    _writer.WriteLine(pending);
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine($"[FusionPoolDiagnostics] Flush failed: {ex.Message}");
                }
            }

            _pendingLines.Clear();
            _writer.Flush();
        }
    }

    private void WriteLine(string line)
    {
        lock (_writeLock)
        {
            if (_writer is null)
            {
                return;
            }

            try
            {
                _writer.Write(DateTime.UtcNow.ToString("O", CultureInfo.InvariantCulture));
                _writer.Write(' ');
                _writer.WriteLine(line);
                _writer.Flush();
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine($"[FusionPoolDiagnostics] Write failed: {ex.Message}");
            }
        }
    }

    private static bool TryReadCounter(EventWrittenEventArgs eventData, out string counterName, out double value)
    {
        counterName = string.Empty;
        value = 0;

        if (eventData.Payload is null ||
            eventData.Payload.Count == 0 ||
            eventData.Payload[0] is not IDictionary payload)
        {
            return false;
        }

        if (!TryReadString(payload, "Name", out counterName) &&
            !TryReadString(payload, "DisplayName", out counterName))
        {
            return false;
        }

        return TryReadDouble(payload, "Mean", out value) ||
               TryReadDouble(payload, "Increment", out value);
    }

    private static bool TryReadString(IDictionary payload, string key, out string value)
    {
        value = string.Empty;
        if (!payload.Contains(key))
        {
            return false;
        }

        if (payload[key] is string s && !string.IsNullOrWhiteSpace(s))
        {
            value = s;
            return true;
        }

        return false;
    }

    private static bool TryReadDouble(IDictionary payload, string key, out double value)
    {
        value = 0;
        if (!payload.Contains(key))
        {
            return false;
        }

        var raw = payload[key];
        if (raw is null)
        {
            return false;
        }

        try
        {
            value = Convert.ToDouble(raw, CultureInfo.InvariantCulture);
            return true;
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine($"[FusionPoolDiagnostics] Counter parse failed for {key}: {ex.Message}");
            return false;
        }
    }

    private static bool IsTargetPoolSource(string sourceName)
        => IsFixedSizeArrayPoolSource(sourceName) ||
           IsPathSegmentPoolSource(sourceName) ||
           IsResultStorePoolSource(sourceName);

    private static bool IsFixedSizeArrayPoolSource(string sourceName)
        => sourceName.Equals(FixedSizeArrayPoolSource, StringComparison.OrdinalIgnoreCase) ||
           sourceName.Contains("FixedSizeArrayPool", StringComparison.OrdinalIgnoreCase);

    private static bool IsPathSegmentPoolSource(string sourceName)
        => sourceName.Equals(PathSegmentPoolSource, StringComparison.OrdinalIgnoreCase) ||
           sourceName.Contains("PathSegmentPool", StringComparison.OrdinalIgnoreCase);

    private static bool IsResultStorePoolSource(string sourceName)
        => sourceName.Equals(ResultStorePoolSource, StringComparison.OrdinalIgnoreCase) ||
           sourceName.Contains("ResultStorePool", StringComparison.OrdinalIgnoreCase) ||
           sourceName.Contains("FetchResultStorePool", StringComparison.OrdinalIgnoreCase);

    private string ResolveDiagnosticsDirectory()
    {
        // Prefer explicit path from the workflow over discovery.
        var envPath = Environment.GetEnvironmentVariable("BENCH_DIAGNOSTICS_DIR");
        if (!string.IsNullOrWhiteSpace(envPath))
        {
            return Path.GetFullPath(envPath);
        }

        // As a fallback search for gateway.far to locate the gateway root.
        var candidates = new[]
        {
            environment.ContentRootPath,
            Directory.GetCurrentDirectory(),
            AppContext.BaseDirectory,
            Path.GetFullPath(Path.Combine(AppContext.BaseDirectory, "..", "..", ".."))
        };

        foreach (var candidate in candidates)
        {
            if (string.IsNullOrWhiteSpace(candidate))
            {
                continue;
            }

            var fullPath = Path.GetFullPath(candidate);
            if (File.Exists(Path.Combine(fullPath, "gateway.far")))
            {
                return Path.Combine(fullPath, "diagnostics");
            }
        }

        return Path.Combine(Path.GetFullPath(environment.ContentRootPath), "diagnostics");
    }

    private void DisposeWriter()
    {
        lock (_writeLock)
        {
            _writer?.Dispose();
            _writer = null;
        }
    }

    public override void Dispose()
    {
        DisposeWriter();
        _snapshotCts?.Dispose();
        base.Dispose();
    }

    private static string Format(double? value)
        => value.HasValue ? value.Value.ToString("0.###", CultureInfo.InvariantCulture) : "na";

    private static string Quote(string? value)
    {
        if (string.IsNullOrEmpty(value))
        {
            return "\"\"";
        }

        return $"\"{value.Replace("\\", "\\\\").Replace("\"", "\\\"").Replace("\r", "\\r").Replace("\n", "\\n")}\"";
    }

    private sealed class PoolState(string name)
    {
        public string Name { get; } = name;

        public bool Attached { get; set; }

        public string SourceName { get; set; } = "n/a";

        public double? Rents { get; private set; }

        public double? Returns { get; private set; }

        public double? Outstanding { get; private set; }

        public double? Exhausted { get; private set; }

        public double? Allocated { get; private set; }

        public double? Dropped { get; private set; }

        public double? Trimmed { get; private set; }

        // Order matters: "outstanding + rent" must be checked before bare "rent"
        // so that e.g. "outstanding-rents" maps to Outstanding, not Rents.
        // The final "outstanding" fallback catches names like "outstanding" without "rent".
        public void ApplyCounter(string counterName, double value)
        {
            var normalized = counterName
                .Replace("-", string.Empty, StringComparison.Ordinal)
                .Replace("_", string.Empty, StringComparison.Ordinal)
                .ToLowerInvariant();

            if (normalized.Contains("outstanding") && normalized.Contains("rent"))
            {
                Outstanding = value;
                return;
            }

            if (normalized.Contains("rent") && !normalized.Contains("return"))
            {
                Rents = value;
                return;
            }

            if (normalized.Contains("return"))
            {
                Returns = value;
                return;
            }

            if (normalized.Contains("exhaust"))
            {
                Exhausted = value;
                return;
            }

            if (normalized.Contains("allocat"))
            {
                Allocated = value;
                return;
            }

            if (normalized.Contains("drop"))
            {
                Dropped = value;
                return;
            }

            if (normalized.Contains("trim"))
            {
                Trimmed = value;
                return;
            }

            if (normalized.Contains("outstanding"))
            {
                Outstanding = value;
            }
        }

        public PoolSnapshot Snapshot()
            => new(
                Name,
                Attached,
                SourceName,
                Rents,
                Returns,
                Outstanding ?? DeriveOutstanding(),
                Exhausted,
                Allocated,
                Dropped,
                Trimmed);

        // Rents/Returns are cumulative counters (total over lifetime),
        // so the difference represents currently outstanding items.
        private double? DeriveOutstanding()
        {
            if (Rents.HasValue && Returns.HasValue)
            {
                return Rents.Value - Returns.Value;
            }

            return null;
        }
    }

    private readonly record struct PoolSnapshot(
        string Name,
        bool Attached,
        string SourceName,
        double? Rents,
        double? Returns,
        double? Outstanding,
        double? Exhausted,
        double? Allocated,
        double? Dropped,
        double? Trimmed);
}
