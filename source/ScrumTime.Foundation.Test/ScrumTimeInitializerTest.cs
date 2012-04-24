extern alias EntityFramework4_3;

using System;
using System.Text;
using System.Linq;
using System.Collections.Generic;
using Microsoft.VisualStudio.TestTools.UnitTesting;

using EntityFramework4_3::System.Data.Entity;

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
            ScrumTimeContext context = new ScrumTimeContext();
            var results = context.Products.FirstOrDefault();
            Assert.IsTrue(results != null);
        }
    }
}
