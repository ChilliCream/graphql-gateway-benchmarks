using eShop.Gateway.BenchmarkDiagnostics;

ThreadPool.SetMinThreads(512, 512);

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureKestrel(options =>
{
    options.Limits.MinResponseDataRate = null;
    options.Limits.MinRequestBodyDataRate = null;
});

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
            MaxConnectionsPerServer = 512,
            PooledConnectionLifetime = TimeSpan.FromMinutes(2)
        })
    .AddHeaderPropagation();

builder
    .AddGraphQLGateway()
    .AddFileSystemConfiguration("./gateway.far");

var app = builder.Build();

app.UseHeaderPropagation();
app.MapGraphQLHttp();

app.Run();