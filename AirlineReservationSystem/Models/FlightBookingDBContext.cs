using Microsoft.EntityFrameworkCore;



namespace FlightBookingSystem.Models
{
    public class FlightBookingDBContext : DbContext
    {
        public FlightBookingDBContext(DbContextOptions<FlightBookingDBContext> options) : base(options) { }

        protected override void OnModelCreating(ModelBuilder modelBuilder) { }

        public DbSet<Bookings> Bookings { get; set; }
        public DbSet<Flights> Flights { get; set; }
        public DbSet<Customers> Customers { get; set; }
        public DbSet<Airports> Airports { get; set; }
        public DbSet<Admin> Admin { get; set; }
        public DbSet<Users> Users { get; set; }
        public DbSet<ExceptionLog> ExceptionLog { get; set; }

        public virtual void sp_DeleteFlight()
        {
        }
    }
    
}
