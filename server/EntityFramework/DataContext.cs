using Microsoft.EntityFrameworkCore;
using Server.Models.User;
using Server.Models.Chat;
using Server.Models.Doctor;

namespace Server.EntityFramework
{
    public class DataContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Doctor> Doctors { get; set; }
        public DbSet<Chat> Chats { get; set; }

        public DataContext(DbContextOptions options) : base(options)
        {

        }
    }
}
