using System.ComponentModel.DataAnnotations;

namespace Server.Models.Chat
{

    public class Chat
    {

        public string? Id { get; set; }

        [Required]
        public string? Message { get; set; }
        [Required]
        public string? SenderId { get; set; }
        [Required]
        public string? ReciverId { get; set; }
    }

}
