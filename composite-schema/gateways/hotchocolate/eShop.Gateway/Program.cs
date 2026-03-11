ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddHttpClient("fusion");

builder
    .AddGraphQLGateway()
    .AddFileSystemConfiguration("./gateway.far");

var app = builder.Build();

app.MapGraphQLHttp();

app.Run();