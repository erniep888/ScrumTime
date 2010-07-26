using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.Models;
using ScrumTime.ViewModels;
using ScrumTime.Helpers;

namespace ScrumTime.Controllers
{
    public class TaskController : Controller
    {

        ScrumTimeEntities _ScrumTimeEntities;

        public TaskController()
        {
            _ScrumTimeEntities = new ScrumTimeEntities();
        }

        public ActionResult ListByStory(int storyId)
        {
            ScrumTimeEntities entities = new ScrumTimeEntities();
            Story story = entities.Stories.First<Story>();  // TODO: Find by story id
            return PartialView(story);
        }

    }
}
