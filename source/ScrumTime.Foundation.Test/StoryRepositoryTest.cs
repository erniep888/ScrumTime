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
    public class StoryRepositoryTest
    {
        [TestMethod]
        public void SetDefaultStoryPointsTest()
        {
            var storyRepository = new StoryRepository();
            storyRepository.SetDefaultStoryPoints();                       
        }
    }
}
