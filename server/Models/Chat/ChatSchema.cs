using GraphQL.Types;

namespace Server.Models.Chat;

public class ChatSchema : Schema
{
    public ChatSchema(IServiceProvider serviceProvider) : base(serviceProvider)
    {
        Query = serviceProvider.GetRequiredService<ChatQuery>();
        Mutation = serviceProvider.GetRequiredService<ChatMutation>();
    }

}