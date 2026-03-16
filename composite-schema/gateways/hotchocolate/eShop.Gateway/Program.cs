ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddHeaderPropagation(options =>
{
    options.Headers.Add("Authorization");
});

builder.Services
    .AddHttpClient("fusion")
    .AddHeaderPropagation();

builder
    .AddGraphQLGateway()
    .AddFileSystemConfiguration("./gateway.far");

var app = builder.Build();

app.UseHeaderPropagation();
app.MapGraphQLHttp();

app.Run();