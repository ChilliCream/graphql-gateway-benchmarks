using Microsoft.AspNetCore.Server.Kestrel.Core;

[assembly: Module("InventoryTypes")]

ThreadPool.SetMinThreads(512, 512);

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureKestrel(options =>
{
    options.ConfigureEndpointDefaults(o => o.Protocols = HttpProtocols.Http2);
});

builder
    .AddGraphQL("inventory-api", disableDefaultSecurity: true)
    .AddInventoryTypes();

var app = builder.Build();

app.MapGraphQLHttp();

await app.RunWithGraphQLCommandsAsync(args);
