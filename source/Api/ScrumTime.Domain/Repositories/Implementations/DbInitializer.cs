using ScrumTime.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ScrumTime.Domain.Repositories.Implementations
{
    public static class DbInitializer
    {
        public static void Initialize(ScrumTimeContext context)
        {
            context.Database.EnsureCreated();

            // if there are any products then there is data in the database
            if (context.Products.Any())
            {
                return;
            }

            var products = new Product[]
            {
                new Product{Name="ScrumTime", Description="An open source agile project management solution."}
            };
            context.Products.AddRange(products);
            context.SaveChanges();

            var releases = new Release[]
            {
                new Release{Name="0.7.0", ProductId = 1},
                new Release{Name="0.8.0", ProductId = 1},
                new Release{Name="0.9.0", ProductId = 1},
                new Release{Name="1.0.0", ProductId = 1}
            };

            context.Releases.AddRange(releases);
            context.SaveChanges();


        }
    }
}