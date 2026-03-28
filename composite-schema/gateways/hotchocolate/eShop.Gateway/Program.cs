using eShop.Gateway.BenchmarkDiagnostics;
using Microsoft.Extensions.Http.Resilience;
using Polly;

ThreadPool.SetMinThreads(512, 512);

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureKestrel(options =>
{
    options.Limits.MinResponseDataRate = null;
    options.Limits.MinRequestBodyDataRate = null;
});

var isDiagnosticRun = Environment.GetEnvironmentVariable("BENCH_DIAGNOSTIC_RUN") == "1";

if (isDiagnosticRun)
{
    builder.Services.AddHostedService<FusionPoolDiagnostics>();
    builder.Services.AddHostedService<FirstChanceExceptionLogger>();
}

builder.Services.AddRequestTimeouts();

builder.Services
    .AddHeaderPropagation(
        options =>
        {
            options.Headers.Add("Authorization");
        });

builder.Services
    .AddHttpClient("fusion")
    .ConfigurePrimaryHttpMessageHandler(
        () => new SocketsHttpHandler
        {
            MaxConnectionsPerServer = 512,
            PooledConnectionLifetime = TimeSpan.FromMinutes(2)
        })
    .AddHeaderPropagation()
    .AddResilienceHandler("fusion-retry", pipeline =>
    {
        pipeline.AddRetry(new HttpRetryStrategyOptions
        {
            MaxRetryAttempts = 3,
            BackoffType = DelayBackoffType.Exponential,
            Delay = TimeSpan.FromMilliseconds(50),
            UseJitter = true,
            ShouldHandle = args => ValueTask.FromResult(
                args.Outcome.Result?.IsSuccessStatusCode == false
                || args.Outcome.Exception is not null)
        });
    });

var gatewayBuilder = builder
    .AddGraphQLGateway()
    .AddFileSystemConfiguration("./gateway.far")
    .ModifyRequestOptions(options =>
    {
        options.ExecutionTimeout = TimeSpan.FromMinutes(1);
    });

if (isDiagnosticRun)
{
    gatewayBuilder.AddDiagnosticEventListener<FusionErrorDiagnostics>();
}

var app = builder.Build();

// --- Admission control ---                          
var maxConcurrency = int.TryParse(
    Environment.GetEnvironmentVariable("BENCH_MAX_CONCURRENCY"),
    out var mc) ? mc : 64;
var gate = new SemaphoreSlim(maxConcurrency, maxConcurrency);
var concurrentRequests = 0;

app.Use(async (context, next) =>
{
    await gate.WaitAsync(context.RequestAborted);
    Interlocked.Increment(ref concurrentRequests);
    try
    {
        await next();
    }
    finally
    {
        Interlocked.Decrement(ref concurrentRequests);
        gate.Release();
    }
});
// --- End admission control ---

app.UseHeaderPropagation();
app.MapGraphQLHttp();

app.Run();