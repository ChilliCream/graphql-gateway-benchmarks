using HotChocolate.Types.Composite;

namespace eShop.Products;

public sealed class Product
{
    [Shareable]
    public required string Upc { get; init; }

    public required string Name { get; init; }

    public long Price { get; init; }

    public long Weight { get; init; }
}
