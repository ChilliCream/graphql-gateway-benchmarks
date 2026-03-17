[assembly: Module("ProductTypes")]

ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder
    .AddGraphQL("products-api", disableDefaultSecurity: true)
    .AddProductTypes()
    .AddHttpRequestInterceptor<BenchmarkHttpRequestInterceptor>();

var app = builder.Build();

app.MapGraphQLHttp();

await app.RunWithGraphQLCommandsAsync(args);
