[assembly: Module("ProductTypes")]

var builder = WebApplication.CreateBuilder(args);

builder
    .AddGraphQL("products-api", disableDefaultSecurity: true)
    .AddProductTypes();

var app = builder.Build();

app.MapGraphQLHttp();

await app.RunWithGraphQLCommandsAsync(args);
