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
    public class BugRepositoryTest
    {
        [TestMethod]
        public void SetDefaultBugInformationTest()
        {
            var bugRepository = new BugRepository();
            bugRepository.SetDefaultBugPriorities();
            bugRepository.SetDefaultBugSeverities();
            bugRepository.SetDefaultBugStatuses();
        }
    }
}
