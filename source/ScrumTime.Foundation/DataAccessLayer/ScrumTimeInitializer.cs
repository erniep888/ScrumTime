extern alias EntityFramework4_3;

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntityFramework4_3::System.Data.Entity;
using ScrumTime.Foundation.Models;

namespace ScrumTime.Foundation.DataAccessLayer
{
    public class ScrumTimeInitializer : DropCreateDatabaseIfModelChanges<ScrumTimeContext>
    {

        protected override void Seed(ScrumTimeContext context)
        {
            var product = new Product()
            {
                Name = "Inventory Tracker",
                Description = "Application for storing location, value, photographs, warranties, and more about your inventory."
            };

            context.Products.Add(product);
            context.SaveChanges();
        }
    }
}
