using System.Globalization;
using HotChocolate;
using HotChocolate.Execution;
using HotChocolate.Fusion.Diagnostics;
using HotChocolate.Fusion.Execution;
using HotChocolate.Fusion.Execution.Nodes;
using Path = System.IO.Path;

namespace eShop.Gateway.BenchmarkDiagnostics;

internal sealed class FusionErrorDiagnostics : FusionExecutionDiagnosticEventListener, IDisposable
{
    private readonly object _writeLock = new();
    private readonly StreamWriter _writer;

    public FusionErrorDiagnostics()
    {
        var diagnosticsDirectory = ResolveDiagnosticsDirectory();
        Directory.CreateDirectory(diagnosticsDirectory);
        var logPath = Path.Combine(diagnosticsDirectory, "fusion-errors.log");
        _writer = new StreamWriter(
            new FileStream(logPath, FileMode.Append, FileAccess.Write, FileShare.ReadWrite))
        {
            AutoFlush = true
        };

        WriteLine("FusionErrorDiagnostics: started");
    }

    public override void ExecutionNodeError(
        OperationPlanContext context,
        ExecutionNode node,
        Exception error)
    {
        WriteLine(
            $"ExecutionNodeError: " +
            $"NodeType={node.GetType().Name}, " +
            $"Exception={Quote(error.GetType().FullName)}, " +
            $"Message={Quote(error.Message)}, " +
            $"StackTrace={Quote(error.StackTrace)}");
    }

    public override void SourceSchemaTransportError(
        OperationPlanContext context,
        ExecutionNode node,
        string schemaName,
        Exception error)
    {
        WriteLine(
            $"SourceSchemaTransportError: " +
            $"Schema={Quote(schemaName)}, " +
            $"NodeType={node.GetType().Name}, " +
            $"Exception={Quote(error.GetType().FullName)}, " +
            $"Message={Quote(error.Message)}, " +
            $"StackTrace={Quote(error.StackTrace)}");
    }

    public override void SourceSchemaStoreError(
        OperationPlanContext context,
        ExecutionNode node,
        string schemaName,
        Exception error)
    {
        WriteLine(
            $"SourceSchemaStoreError: " +
            $"Schema={Quote(schemaName)}, " +
            $"NodeType={node.GetType().Name}, " +
            $"Exception={Quote(error.GetType().FullName)}, " +
            $"Message={Quote(error.Message)}, " +
            $"StackTrace={Quote(error.StackTrace)}");
    }

    public override void SourceSchemaResultError(
        OperationPlanContext context,
        ExecutionNode node,
        string schemaName,
        IReadOnlyList<IError> errors)
    {
        foreach (var error in errors)
        {
            var inner = error.Exception;
            WriteLine(
                $"SourceSchemaResultError: " +
                $"Schema={Quote(schemaName)}, " +
                $"NodeType={node.GetType().Name}, " +
                $"Code={Quote(error.Code)}, " +
                $"Message={Quote(error.Message)}, " +
                $"Path={Quote(error.Path?.ToString())}" +
                (inner is not null
                    ? $", Exception={Quote(inner.GetType().FullName)}, ExceptionMessage={Quote(inner.Message)}"
                    : ""));
        }
    }

    public override void PlanOperationError(
        RequestContext context,
        string operationId,
        Exception error)
    {
        WriteLine(
            $"PlanOperationError: " +
            $"OperationId={Quote(operationId)}, " +
            $"Exception={Quote(error.GetType().FullName)}, " +
            $"Message={Quote(error.Message)}, " +
            $"StackTrace={Quote(error.StackTrace)}");
    }

    public override void RequestError(RequestContext context, Exception error)
    {
        WriteLine(
            $"RequestError: " +
            $"Exception={Quote(error.GetType().FullName)}, " +
            $"Message={Quote(error.Message)}, " +
            $"StackTrace={Quote(error.StackTrace)}");
    }

    public override void RequestError(RequestContext context, IError error)
    {
        var inner = error.Exception;
        WriteLine(
            $"RequestError: " +
            $"Code={Quote(error.Code)}, " +
            $"Message={Quote(error.Message)}, " +
            $"Path={Quote(error.Path?.ToString())}" +
            (inner is not null
                ? $", Exception={Quote(inner.GetType().FullName)}, ExceptionMessage={Quote(inner.Message)}"
                : ""));
    }

    private void WriteLine(string line)
    {
        lock (_writeLock)
        {
            _writer.Write(DateTime.UtcNow.ToString("O", CultureInfo.InvariantCulture));
            _writer.Write(' ');
            _writer.WriteLine(line);
        }
    }

    private static string ResolveDiagnosticsDirectory()
    {
        var envPath = Environment.GetEnvironmentVariable("BENCH_DIAGNOSTICS_DIR");
        if (!string.IsNullOrWhiteSpace(envPath))
        {
            return Path.GetFullPath(envPath);
        }

        var candidates = new[]
        {
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

        return Path.Combine(Path.GetFullPath(Directory.GetCurrentDirectory()), "diagnostics");
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
        lock (_writeLock)
        {
            _writer.Dispose();
        }
    }
}
