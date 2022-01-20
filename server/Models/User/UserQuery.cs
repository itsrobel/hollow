using GraphQL.Types;
using Server.EntityFramework;

namespace Server.Models.User
{

    public class UserQuery : ObjectGraphType
    {
        public UserQuery()
        {
            Field<ListGraphType<UserType>>("user", resolve: context =>
            {
                var DataContext = context.RequestServices.GetRequiredService<DataContext>();

                return DataContext.Users.DefaultIfEmpty();

            }
            );
        }

    }

}
