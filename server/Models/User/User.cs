using System.ComponentModel.DataAnnotations;

namespace Server.Models.User
{

    public class User
    {
        public string? Id { get; set; }

        [Required]

        public string? Username { get; set; }
        public string? Email { get; set; }
        public int? Age { get; set; }
        public string? Gender { get; set; }
    }

}
