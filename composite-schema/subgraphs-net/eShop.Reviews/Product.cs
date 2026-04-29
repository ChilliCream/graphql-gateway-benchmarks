using HotChocolate.Types;
using HotChocolate.Types.Composite;

namespace eShop.Reviews;


[ObjectType]
public sealed class Product
{
    [Shareable]
    public required string Upc { get; init; }

    public IEnumerable<Review> GetReviews()
        => ReviewRepository.GetByProductUpc(Upc);
}
