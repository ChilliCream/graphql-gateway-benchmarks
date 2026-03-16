using HotChocolate;
using HotChocolate.ApolloFederation.Resolvers;
using HotChocolate.ApolloFederation.Types;
using HotChocolate.Types;

namespace eShop.Reviews;

[ExtendServiceType]
[Key("id")]
public sealed class User
{
    [External]
    [GraphQLType(typeof(IdType))]
    public string Id { get; set; } = default!;

    public IEnumerable<Review> GetReviews()
        => ReviewRepository.GetByUserId(Id);

    [ReferenceResolver]
    public static User ResolveReference(string id) => new() { Id = id };
}
