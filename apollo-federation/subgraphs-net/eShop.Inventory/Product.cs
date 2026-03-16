using HotChocolate.ApolloFederation.Resolvers;
using HotChocolate.ApolloFederation.Types;

namespace eShop.Inventory;

[ExtendServiceType]
[Key("upc")]
public sealed class Product
{
    [External]
    public string Upc { get; set; } = default!;

    [External]
    public int Weight { get; set; }

    [External]
    public int Price { get; set; }

    public bool InStock { get; set; }

    [Requires("price weight")]
    public int? GetShippingEstimate() => Price > 1000 ? 0 : Weight / 2;

    private static readonly Dictionary<string, bool> s_inventory = new()
    {
        { "1", true },
        { "2", false },
        { "3", false },
        { "4", false },
        { "5", true },
        { "6", true },
        { "7", true },
        { "8", false },
        { "9", true }
    };

    [ReferenceResolver]
    public static Product? ResolveReference(string upc)
        => s_inventory.TryGetValue(upc, out var inStock)
            ? new Product { Upc = upc, InStock = inStock }
            : null;
}
