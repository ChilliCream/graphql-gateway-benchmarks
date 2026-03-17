[assembly: Module("ReviewTypes")]

ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder
    .AddGraphQL("reviews-api", disableDefaultSecurity: true)
    .AddReviewTypes()
    .AddHttpRequestInterceptor<BenchmarkHttpRequestInterceptor>();

var app = builder.Build();

app.MapGraphQLHttp();

await app.RunWithGraphQLCommandsAsync(args);
