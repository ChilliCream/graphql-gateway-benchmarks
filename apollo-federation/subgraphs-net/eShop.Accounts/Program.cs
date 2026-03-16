using HotChocolate.ApolloFederation;

ThreadPool.SetMinThreads(256, 256);

var builder = WebApplication.CreateBuilder(args);

builder.Services
    .AddGraphQLServer()
    .AddApolloFederation(FederationVersion.Federation27)
    .AddQueryType<eShop.Accounts.Query>();

var app = builder.Build();

app.Use(async (context, next) =>
{
    context.Request.Headers.Accept = "application/json";
    await next();
});

app.MapGraphQL();
await app.RunAsync();
