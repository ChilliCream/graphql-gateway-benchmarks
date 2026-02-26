var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddHttpClient("Fusion");

builder
    .AddGraphQLGateway()
    .AddFileSystemConfiguration("./gateway.far");

var app = builder.Build();

app.MapGraphQLHttp();

app.Run();
