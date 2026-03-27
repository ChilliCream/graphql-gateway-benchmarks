using System.Collections.Concurrent;
using System.Globalization;
using System.Runtime.ExceptionServices;

namespace eShop.Gateway.BenchmarkDiagnostics;

/// <summary>
/// Logs all first-chance exceptions in the process.
/// Deduplicates by exception type + first stack frame to avoid flooding.
/// </summary>
internal sealed class FirstChanceExceptionLogger : IHostedService, IDisposable
{
    private readonly IHostEnvironment _environment;
    private readonly object _writeLock = new();
    private readonly ConcurrentDictionary<string, long> _seen = new();

    private StreamWriter? _writer;
    private CancellationTokenSource? _flushCts;
    private Task? _flushTask;

    public FirstChanceExceptionLogger(IHostEnvironment environment)
    {
        _environment = environment;
    }

    public Task StartAsync(CancellationToken cancellationToken)
    {
        var diagnosticsDirectory = ResolveDiagnosticsDirectory();
        Directory.CreateDirectory(diagnosticsDirectory);
        var logPath = Path.Combine(diagnosticsDirectory, "first-chance-exceptions.log");
        _writer = new StreamWriter(
            new FileStream(logPath, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
        {
            AutoFlush = false
        };

        WriteLine("FirstChanceExceptionLogger: started");

        AppDomain.CurrentDomain.FirstChanceException += OnFirstChanceException;

        _flushCts = CancellationTokenSource.CreateLinkedTokenSource(cancellationToken);
        _flushTask = FlushLoopAsync(_flushCts.Token);

        return Task.CompletedTask;
    }

    public async Task StopAsync(CancellationToken cancellationToken)
    {
        AppDomain.CurrentDomain.FirstChanceException -= OnFirstChanceException;

        if (_flushCts is not null)
        {
            await _flushCts.CancelAsync().ConfigureAwait(false);
        }

        if (_flushTask is not null)
        {
            try
            {
                await _flushTask.WaitAsync(cancellationToken).ConfigureAwait(false);
            }
            catch (OperationCanceledException)
            {
            }
        }

        FlushSummary();
        WriteLine("FirstChanceExceptionLogger: stopped");
        DisposeWriter();
    }

    private void OnFirstChanceException(object? sender, FirstChanceExceptionEventArgs e)
    {
        var ex = e.Exception;
        var key = BuildKey(ex);

        var count = _seen.AddOrUpdate(key, 1, (_, prev) => prev + 1);

        // Log full details on first occurrence only.
        if (count == 1)
        {
            WriteLine(
                $"NEW: Type={Quote(ex.GetType().FullName)}, " +
                $"Message={Quote(ex.Message)}, " +
                $"Source={Quote(ex.Source)}, " +
                $"StackTrace={Quote(ex.StackTrace)}");
        }
    }

    private async Task FlushLoopAsync(CancellationToken cancellationToken)
    {
        try
        {
            using var timer = new PeriodicTimer(TimeSpan.FromSeconds(10));
            while (await timer.WaitForNextTickAsync(cancellationToken).ConfigureAwait(false))
            {
                FlushSummary();
            }
        }
        catch (OperationCanceledException) when (cancellationToken.IsCancellationRequested)
        {
        }
    }

    private void FlushSummary()
    {
        if (_seen.IsEmpty)
        {
            return;
        }

        // Snapshot and reset counters.
        var snapshot = new List<KeyValuePair<string, long>>();
        foreach (var kvp in _seen)
        {
            snapshot.Add(kvp);
        }

        if (snapshot.Count == 0)
        {
            return;
        }

        WriteLine($"SUMMARY: {snapshot.Count} distinct exception types, counts:");
        foreach (var kvp in snapshot.OrderByDescending(x => x.Value))
        {
            WriteLine($"  Count={kvp.Value.ToString(CultureInfo.InvariantCulture)}, Key={Quote(kvp.Key)}");
        }

        Flush();
    }

    private static string BuildKey(Exception ex)
    {
        var typeName = ex.GetType().FullName ?? ex.GetType().Name;
        var trace = ex.StackTrace;

        if (string.IsNullOrEmpty(trace))
        {
            return typeName;
        }

        // Use first meaningful stack frame as part of the key.
        var firstLine = trace.AsSpan();
        var newlineIdx = firstLine.IndexOf('\n');
        if (newlineIdx > 0)
        {
            firstLine = firstLine[..newlineIdx];
        }

        return $"{typeName} @ {firstLine.Trim()}";
    }

    private void WriteLine(string line)
    {
        lock (_writeLock)
        {
            if (_writer is null)
            {
                return;
            }

            _writer.Write(DateTime.UtcNow.ToString("O", CultureInfo.InvariantCulture));
            _writer.Write(' ');
            _writer.WriteLine(line);
        }
    }

    private void Flush()
    {
        lock (_writeLock)
        {
            _writer?.Flush();
        }
    }

    private string ResolveDiagnosticsDirectory()
    {
        var envPath = Environment.GetEnvironmentVariable("BENCH_DIAGNOSTICS_DIR");
        if (!string.IsNullOrWhiteSpace(envPath))
        {
            return Path.GetFullPath(envPath);
        }

        var candidates = new[]
        {
            _environment.ContentRootPath,
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

        return Path.Combine(Path.GetFullPath(_environment.ContentRootPath), "diagnostics");
    }

    private void DisposeWriter()
    {
        lock (_writeLock)
        {
            _writer?.Dispose();
            _writer = null;
        }
    }

    private static string Quote(string? value)
    {
        if (string.IsNullOrEmpty(value))
        {
            return "\"\"";
        }

        return $"\"{value.Replace("\\", "\\\\").Replace("\"", "\\\"").Replace("\r", "\\r").Replace("\n", "\\n")}\"";
    }

    public void Dispose()
    {
        _flushCts?.Dispose();
        DisposeWriter();
    }
}
