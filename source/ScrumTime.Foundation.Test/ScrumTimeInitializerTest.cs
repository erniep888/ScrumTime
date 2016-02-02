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
        public void SeedStoryTest()
        {
            var connectionString = "mongodb://localhost/?safe=true";
            var server = MongoServer.Create(connectionString);

            var database = server.GetDatabase("ScrumTime");

            var collection = database.GetCollection<Story>("stories");

            var storyChild = new Story()
            {
                Name = "Login Hide",
                Narrative = "As an anonymous user, I need to see more of the screen prior to logging in so that I may see recent quotes.",
                Points = "5",
                Priority = 200
            };

            var storyParent = new Story()
            {
                Name = "Login Control",
                Narrative = "As an anonymous user, I need to login so that the system provides authorized access.",
                Points = "13",
                Priority = 200,
                Children = new List<Story>()
            };

            storyParent.Children.Add(storyChild);

            try
            {
                collection.Insert(storyParent);
            }
            catch (Exception ex)
            {
                Assert.Fail();
            }
        }

        [TestMethod]
        public void SeedProductTest()
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
        public void BugRepositoryTest()
        {
            var bugRepository = new BugRepository();
            bugRepository.SetDefaultBugPriorities();
            bugRepository.SetDefaultBugSeverities();
            bugRepository.SetDefaultBugStatuses();
        }
    }
}
