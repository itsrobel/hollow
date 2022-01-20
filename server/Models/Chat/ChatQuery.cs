
using GraphQL.Types;
using Server.EntityFramework;

namespace Server.Models.Chat
{

    public class ChatQuery : ObjectGraphType
    {
        public ChatQuery()
        {
            Field<ListGraphType<ChatType>>("chat", resolve: context =>
            {
                var DataContext = context.RequestServices.GetRequiredService<DataContext>();

                return DataContext.Chats.DefaultIfEmpty();

            }
            );
        }

    }

}
