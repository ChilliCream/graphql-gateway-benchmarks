using HotChocolate.ApolloFederation.Resolvers;
using HotChocolate.ApolloFederation.Types;

namespace eShop.Reviews;

[ExtendServiceType]
[Key("upc")]
public sealed class Product
{
    [External]
    public string Upc { get; set; } = default!;

    public IEnumerable<Review> GetReviews()
        => ReviewRepository.GetByProductUpc(Upc);

    [ReferenceResolver]
    public static Product ResolveReference(string upc) => new() { Upc = upc };
}
