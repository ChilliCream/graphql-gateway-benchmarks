using Microsoft.AspNetCore.Server.Kestrel.Core;

[assembly: Module("ProductTypes")]

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureKestrel(options =>
{
    options.ConfigureEndpointDefaults(o => o.Protocols = HttpProtocols.Http2);
});

builder
    .AddGraphQL("products-api", disableDefaultSecurity: true)
    .AddProductTypes();

var app = builder.Build();

app.MapGraphQLHttp();

await app.RunWithGraphQLCommandsAsync(args);
