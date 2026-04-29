using HotChocolate.Types.Composite;

namespace eShop.Inventory;

public sealed class Product
{
    [Shareable]
    public required string Upc { get; init; }

    public bool InStock { get; init; }
}
