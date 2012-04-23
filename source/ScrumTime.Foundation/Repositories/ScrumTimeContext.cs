extern alias EntityFramework4_3;

using ScrumTime.Foundation.Models;
using EntityFramework4_3::System.Data.Entity;

namespace ScrumTime.Foundation.Repositories
{
    public class ScrumTimeContext : DbContext
    {
        public DbSet<Product> Products { get; set; }        
    }
}
