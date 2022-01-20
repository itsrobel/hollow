using GraphQL;
using GraphQL.Types;
using Server.EntityFramework;

namespace Server.Models.Chat
{
    public class ChatMutation : ObjectGraphType
    {
        public ChatMutation()
        {
            Field<ChatType>(
                "createNote",
                arguments: new QueryArguments(
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "message" },
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "senderid" },
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "reciverid" }
                ),
                resolve: context =>
                {
                    var message = context.GetArgument<string>("message");
                    var senderid = context.GetArgument<string>("senderid");
                    var reciverid = context.GetArgument<string>("reciverid");
                    var id = Guid.NewGuid().ToString().Replace("-", string.Empty);
                    var DataContext = context.RequestServices.GetRequiredService<DataContext>();
                    Chat chat = new Chat
                    {
                        Id = id,
                        Message = message,
                        SenderId = senderid,
                        ReciverId = reciverid
                    };
                    DataContext.Chats.Add(chat);
                    DataContext.SaveChanges();
                    return chat;
                }
            );
        }
    }
}
