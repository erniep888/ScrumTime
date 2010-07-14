using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.Models;
using ScrumTime.Helpers;

namespace ScrumTime.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Story(string test)
        {
            var eval = test;
            ScrumTimeEntities entities = new ScrumTimeEntities();
            Story story = entities.Stories.First<Story>();
            return PartialView("StoryTrControl",story);
        }

        public ActionResult StoryJson(string test)
        {
            string[] acceptTypes = Request.AcceptTypes;
            
            var eval = test;
            ScrumTimeEntities entities = new ScrumTimeEntities();
            Story story = entities.Stories.First<Story>();
            if (acceptTypes.Any(v => v.Contains("json")))
            {
                List<object> stories = new List<object>();
                stories.Add(new { Narrative = story.Narrative, Points = story.Points, StoryId = story.StoryId });
                return new SecureJsonResult(stories);
            }
            else
                return PartialView("StoryControl", story);
        }

        public ActionResult StoryEdit()
        {
            ScrumTimeEntities entities = new ScrumTimeEntities();
            return PartialView("StoryEditControl");
        }

    }
}
