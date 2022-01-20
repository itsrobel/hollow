using GraphQL.Types;
namespace Server.Models.Chat
{
    public class ChatType : ObjectGraphType<Chat>
    {
        public ChatType()
        {
            Name = "chat";
            Field(x => x.Id).Description("Chat Id");
            Field(x => x.Message).Description("Chat Message");
            Field(x => x.SenderId).Description("The chat senders Id");
            Field(x => x.ReciverId).Description("The chat recivers Id");

        }

    }
}