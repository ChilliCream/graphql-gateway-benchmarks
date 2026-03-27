using eShop.Gateway.BenchmarkDiagnostics;

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
    .AddHeaderPropagation();

var gatewayBuilder = builder
    .AddGraphQLGateway()
    .AddFileSystemConfiguration("./gateway.far");

if (isDiagnosticRun)
{
    gatewayBuilder.AddDiagnosticEventListener<FusionErrorDiagnostics>();
}

var app = builder.Build();

app.UseHeaderPropagation();
app.MapGraphQLHttp();

app.Run();