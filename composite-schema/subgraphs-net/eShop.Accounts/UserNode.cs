using HotChocolate;
using HotChocolate.Types;
using HotChocolate.Types.Composite;
using HotChocolate.Types.Relay;

namespace eShop.Accounts;

[ObjectType<User>]
public static partial class UserNode
{
    [ID]
    [Shareable]
    public static string GetId([Parent] User user) => user.Id;
}
