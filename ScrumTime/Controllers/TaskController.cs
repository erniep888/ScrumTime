using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.Models;
using ScrumTime.ViewModels;
using ScrumTime.Helpers;
using ScrumTime.Services;

namespace ScrumTime.Controllers
{
    public class TaskController : Controller
    {

        ScrumTimeEntities _ScrumTimeEntities;
        StoryService _StoryService;
        TaskService _TaskService;        

        public TaskController()
        {
            _ScrumTimeEntities = new ScrumTimeEntities();
            _StoryService = new StoryService(_ScrumTimeEntities);
            _TaskService = new TaskService(_ScrumTimeEntities);
        }

        public ActionResult ListByStory(int storyId)
        {
            ScrumTimeEntities entities = new ScrumTimeEntities();
            Story story = _StoryService.GetStoryById(storyId);
            return PartialView(story);
        }

        public ActionResult EditRow(int id)
        {
            Task task = _TaskService.GetTaskById(id);            
            return PartialView(task);
        }

    }
}
