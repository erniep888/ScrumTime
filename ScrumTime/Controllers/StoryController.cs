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
    public class StoryController : Controller
    {
        ScrumTimeEntities _ScrumTimeEntities;

        public StoryController()
        {
            _ScrumTimeEntities = new ScrumTimeEntities();
        }



        /************* \/ *********************** Alizarin */
        public ActionResult StoryTasks(string test)
        {
            var eval = test;
            ScrumTimeEntities entities = new ScrumTimeEntities();
            Story story = entities.Stories.First<Story>();
            return PartialView("StoryTrControl", story);
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

        public ActionResult ReadOnlyRow(int id)
        {
            Story story = GetStoryById(id);
            return PartialView("StoryReadOnlyRow", story);
        }

        public ActionResult Edit(int id)
        {
            Story story = GetStoryById(id);
            return PartialView("StoryEditControl", story);
        }

        private Story GetStoryById(int id)
        {
            Story story = null;
            ScrumTimeEntities entities = new ScrumTimeEntities();
            var results = from s in entities.Stories
                          where s.StoryId == id
                          select s;
            if (results.Count() > 0)
                story = results.First<Story>();
            else
                story = new Story();
            return story;
        }

        /************* /\ *********************** Alizarin */


        public ActionResult List()
        {
            StoryCollectionViewModel storyCollectionViewModel = new StoryCollectionViewModel();
            storyCollectionViewModel.SelectedSubMenuName = "Backlog";
            storyCollectionViewModel.Name = "Acme";
            ScrumTimeEntities entities = new ScrumTimeEntities();
            List<Story> stories = entities.Stories.ToList<Story>();
            storyCollectionViewModel.Stories = stories;
            return View(storyCollectionViewModel);
        }

        //
        // GET: /Story/

        public ActionResult Index()
        {
            //var results = from s in _ScrumTimeEntities.Stories
            //              select s;
            return View(new ProjectViewModel());
        }

        //
        // GET: /Story/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Story/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Story/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Story/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Story/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
