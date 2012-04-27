using System;
using System.Text;
using System.Linq;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using MongoDB.Driver.Builders;

using ScrumTime.Foundation.DataAccessLayer;
using ScrumTime.Foundation.Models;

namespace ScrumTime.Foundation.Test
{
    [TestClass]
    public class ScrumTimeInitializerTest
    {
        [TestMethod]
        public void FindTest()
        {
            var connectionString = "mongodb://localhost/?safe=true";
            var server = MongoServer.Create(connectionString);

            var database = server.GetDatabase("ScrumTime");
            var collection = database.GetCollection<Product>("products");

            var product = (from e in collection.AsQueryable<Product>()
                          select e).FirstOrDefault();
            Assert.IsNotNull(product);
            
        }

        [TestMethod]
        public void SeedTest()
        {
            var connectionString = "mongodb://localhost/?safe=true";
            var server = MongoServer.Create(connectionString);

            var database = server.GetDatabase("ScrumTime");

            var collection = database.GetCollection<Product>("products");

            var product = new Product()
            {
                Name = "Personal Inventory",
                Description = "A personal inventory web application."
            };

            try
            {
                collection.Insert(product);
            }
            catch (Exception ex)
            {
                Assert.Fail();
            }
        }
    }
}
