using Microsoft.EntityFrameworkCore;
using ScrumTime.Domain.Models;

namespace ScrumTime.Domain.Repositories.Implementations
{
    public class ScrumTimeContext : DbContext
    {
        public ScrumTimeContext(DbContextOptions<ScrumTimeContext> options)
            : base(options)
        {
            
        }

        public DbSet<Product> Products {get;set;}
        public DbSet<Release> Releases {get;set;}

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Product>().ToTable("Products");
            modelBuilder.Entity<Release>().ToTable("Releases");            
        }
    }
}