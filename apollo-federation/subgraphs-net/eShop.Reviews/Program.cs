using HotChocolate.ApolloFederation;

ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddGraphQLServer()
    .AddApolloFederation(FederationVersion.Federation27)
    .AddQueryType<eShop.Reviews.Query>()
    .AddType<eShop.Reviews.Review>()
    .AddType<eShop.Reviews.User>()
    .AddType<eShop.Reviews.Product>();

var app = builder.Build();
app.MapGraphQL();
await app.RunAsync();
