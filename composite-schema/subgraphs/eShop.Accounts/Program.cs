[assembly: Module("AccountTypes")]

ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder
    .AddGraphQL("accounts-api", disableDefaultSecurity: true)
    .AddAccountTypes();

var app = builder.Build();

app.MapGraphQLHttp();

await app.RunWithGraphQLCommandsAsync(args);
