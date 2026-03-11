using Microsoft.AspNetCore.Server.Kestrel.Core;

[assembly: Module("ReviewTypes")]

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureKestrel(options =>
{
    options.ConfigureEndpointDefaults(o => o.Protocols = HttpProtocols.Http2);
});

builder.Services
    .AddGraphQLServer("reviews-api", disableDefaultSecurity: true)
    .AddReviewTypes();

var app = builder.Build();

app.MapGraphQLHttp();

await app.RunWithGraphQLCommandsAsync(args);
