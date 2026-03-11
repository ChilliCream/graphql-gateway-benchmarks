using System.Net;

ThreadPool.SetMinThreads(1024, 1024);

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddHttpClient("fusion")
    .ConfigurePrimaryHttpMessageHandler(
        () => new SocketsHttpHandler
        {
            MaxConnectionsPerServer = 512,
            EnableMultipleHttp2Connections = true
        })
    .ConfigureHttpClient(
        client =>
        {
            client.DefaultRequestVersion = HttpVersion.Version20;
            client.DefaultVersionPolicy = HttpVersionPolicy.RequestVersionExact;
        });

builder
    .AddGraphQLGateway()
    .AddFileSystemConfiguration("./gateway.far");

var app = builder.Build();

app.MapGraphQLHttp();

app.Run();
