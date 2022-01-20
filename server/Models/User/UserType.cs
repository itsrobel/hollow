using GraphQL.Types;
namespace Server.Models.User
{
    public class UserType : ObjectGraphType<User>
    {
        public UserType()
        {
            Name = "User";
            Field(x => x.Id).Description("User Id");
            Field(x => x.Username).Description("The User's code name to protect their identity");
            Field(x => x.Age).Description("User Age");
            Field(x => x.Gender).Description("User Gender");

        }

    }
}