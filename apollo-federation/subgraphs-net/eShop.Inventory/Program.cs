using HotChocolate.AspNetCore;
using HotChocolate.ApolloFederation;

ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddGraphQLServer()
    .AddApolloFederation(FederationVersion.Federation27)
    // Fusion sends transport-level request batches (a JSON array of operations) to
    // subgraphs; HotChocolate 16 rejects those with HC0009 unless batching is enabled.
    .ModifyServerOptions(o => o.Batching = AllowedBatching.All)
    .AddQueryType<eShop.Inventory.Query>()
    .AddType<eShop.Inventory.Product>()
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

app.MapGraphQL();
await app.RunAsync();
