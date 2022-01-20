using GraphQL.Types;

namespace Server.Models.User;

public class UserSchema : Schema
{
    public UserSchema(IServiceProvider serviceProvider) : base(serviceProvider)
    {
        Query = serviceProvider.GetRequiredService<UserQuery>();
        Mutation = serviceProvider.GetRequiredService<UserMutation>();
    }

}