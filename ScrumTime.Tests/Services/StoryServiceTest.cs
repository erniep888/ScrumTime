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
    public class StoryServiceTest
    {

        [TestMethod]
        public void AddNewStory()
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            StoryService storyService = new StoryService(scrumTimeEntities);
            Story story = new Story()
            {
                Narrative = "Test story",
                Points = 8,
                Priority = 2,
                ProductId = 1,
                UserDefinedId = "not set"
            };
            storyService.SaveStory(story);
        }

        [TestMethod]
        public void ChangePriorityOfExistingStory()
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            StoryService storyService = new StoryService(scrumTimeEntities);
            Story story = storyService.GetStoryById(2);
            story.Priority = 0;
            storyService.SaveStory(story);
        }

        [TestMethod]
        public void DeleteStory()
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            StoryService storyService = new StoryService(scrumTimeEntities);
            Story story = new Story()
            {
                Narrative = "Test story for deletion test.",
                Points = 8,
                Priority = 2,
                ProductId = 1,
                UserDefinedId = "not set"
            };
            storyService.SaveStory(story);

            storyService.DeleteStory(story.StoryId);
        }
    }
}
