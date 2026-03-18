using eShop.Gateway.BenchmarkDiagnostics;

ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

if (Environment.GetEnvironmentVariable("BENCH_DIAGNOSTIC_RUN") == "1")
{
    builder.Services.AddHostedService<FusionPoolDiagnostics>();
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
            MaxConnectionsPerServer = 256
        })
    .AddHeaderPropagation();

builder
    .AddGraphQLGateway()
    .AddFileSystemConfiguration("./gateway.far");

var app = builder.Build();

app.UseHeaderPropagation();
app.MapGraphQLHttp();

app.Run();