[assembly: Module("InventoryTypes")]

ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder
    .AddGraphQL("inventory-api", disableDefaultSecurity: true)
    .AddInventoryTypes();

var app = builder.Build();

app.MapGraphQLHttp();

await app.RunWithGraphQLCommandsAsync(args);
