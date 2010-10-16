using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ScrumTime;
using ScrumTime.Models;
using ScrumTime.Services;

namespace ScrumTime.Tests.Services
{
    [TestClass]
    public class SprintServiceTest
    {

        [TestMethod]
        public void GetSprintsWithinDateRangeTest()
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            SprintService sprintService = new SprintService(scrumTimeEntities);
            List<Sprint> sprints =
                sprintService.GetSprintsWithinDateRange(1, new DateTime(2010, 1, 1), 
                    new DateTime(2010, 6, 5));
            Assert.AreEqual(5, sprints.Count());
        }

        
    }
}
