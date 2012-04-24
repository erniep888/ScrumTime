extern alias EntityFramework4_3;

using ScrumTime.Foundation.Models;
using EntityFramework4_3::System.Data.Entity;

namespace ScrumTime.Foundation.DataAccessLayer
{
    public class ScrumTimeContext : DbContext
    {
        public DbSet<Actor> Actors { get; set; }
        public DbSet<Artifact> Artifacts { get; set; }
        public DbSet<Bug> Bugs { get; set; }
        public DbSet<Feature> Features { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<Release> Releases { get; set; }
        public DbSet<Scrum> Scrums { get; set; }
        public DbSet<ScrumTask> ScrumTasks { get; set; }
        public DbSet<Sprint> Sprints { get; set; }
        public DbSet<Story> Stories { get; set; }
        public DbSet<Task> Tasks { get; set; }
        public DbSet<Team> Teams { get; set; }
    }
}
