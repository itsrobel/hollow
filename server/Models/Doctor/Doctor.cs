using System.ComponentModel.DataAnnotations;

namespace Server.Models.Doctor
{

    public class Doctor
    {
        public string? Id { get; set; }

        [Required]

        public string? Name { get; set; }
        public string? Email { get; set; }
        public int? Rating { get; set; }
        public decimal? Longitude { get; set; }
        public decimal? Latitude { get; set; }
        public string? OpenHours { get; set; }
    }

}
