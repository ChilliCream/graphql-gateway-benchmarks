using HotChocolate.ApolloFederation;

ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddGraphQLServer()
    .AddApolloFederation(FederationVersion.Federation27)
    .AddQueryType<eShop.Products.Query>();

var app = builder.Build();
app.MapGraphQL();
await app.RunAsync();
