using GraphQL;
using GraphQL.Types;
using Server.EntityFramework;

namespace Server.Models.User
{
    public class UserMutation : ObjectGraphType
    {
        public UserMutation()
        {
            Field<UserType>(
                "createUser",
                arguments: new QueryArguments(
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "username" },
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "age" },
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "gender" },
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "email" }
                ),
                resolve: context =>
                {
                    var username = context.GetArgument<string>("username");
                    var email = context.GetArgument<string>("email");
                    var gender = context.GetArgument<string>("gender");
                    var age = context.GetArgument<int>("age");
                    var id = Guid.NewGuid().ToString().Replace("-", string.Empty);
                    var DataContext = context.RequestServices.GetRequiredService<DataContext>();
                    User user = new User
                    {
                        Id = id,
                        Username = username,
                        Gender = gender,
                        Email = email,
                        Age = age


                    };
                    DataContext.Users.Add(user);
                    DataContext.SaveChanges();
                    return user;
                }
            );
        }
    }
}
