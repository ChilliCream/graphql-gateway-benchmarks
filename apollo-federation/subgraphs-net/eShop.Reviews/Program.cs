using HotChocolate.ApolloFederation;

ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddGraphQLServer()
    .AddApolloFederation(FederationVersion.Federation27)
    .AddQueryType<eShop.Reviews.Query>()
    .AddType<eShop.Reviews.Review>()
    .AddType<eShop.Reviews.User>()
    .AddType<eShop.Reviews.Product>()
    .AddHttpRequestInterceptor<BenchmarkHttpRequestInterceptor>();

var app = builder.Build();

if (string.Equals(Environment.GetEnvironmentVariable("BENCHMARK_SIMULATE_LATENCY"), "1"))
{
    app.Use(static next =>
        async context =>
        {
            await Task.Delay(4);
            await next(context);
        });
}

app.Use(async (context, next) =>
{
    context.Request.Headers.Accept = "application/json";
    await next();
});

app.MapGraphQL();
await app.RunAsync();
