extern alias EntityFramework5;

using System;
using System.Text;
using System.Linq;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using EntityFramework5::System.Data.Entity;

using ScrumTime.Foundation.DataAccessLayer;
using ScrumTime.Foundation.Models;

namespace ScrumTime.Foundation.Test
{
    [TestClass]
    public class ScrumTimeInitializerTest
    {
        [TestMethod]
        public void SeedTest()
        {
            Database.SetInitializer<ScrumTimeContext>(new ScrumTimeInitializer());
            using (var scrumTimeContext = new ScrumTimeContext())
            {
                var q1 = from p in scrumTimeContext.Products
                         where p.ProductId == 1
                         select p;
                var p1 = q1.First();
                Assert.IsTrue(p1 != null);
            }
                       
        }
    }
}
