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
    public class StoryController : Controller
    {
        ScrumTimeEntities _ScrumTimeEntities;
        StoryService _StoryService;

        public StoryController()
        {
            _ScrumTimeEntities = new ScrumTimeEntities();
            _StoryService = new StoryService(_ScrumTimeEntities);
        }


        /************* \/ *********************** Alizarin */

        public ActionResult ListByPriority()
        {
            StoryCollectionViewModel storyCollectionViewModel = new StoryCollectionViewModel();
            storyCollectionViewModel.ProjectId = 1;
            storyCollectionViewModel.SelectedSubMenuName = "Backlog";
            storyCollectionViewModel.Name = "Acme";  // TODO: Get this from current project
            ScrumTimeEntities entities = new ScrumTimeEntities();
            var results = from s in entities.Stories
                          orderby s.Priority ascending
                          select s;
            List<Story> stories = results.ToList<Story>();
            storyCollectionViewModel.Stories = stories;
            if (Request.Params["displayPartial"] != null)
                return PartialView("ListContents", storyCollectionViewModel);
            else
                return View(storyCollectionViewModel);
        }

        public ActionResult ReadOnlyRow(int id)
        {
            Story story = _StoryService.GetStoryById(id);
            return PartialView(story);
        }

        public ActionResult EditRow(int id)
        {
            Story story = _StoryService.GetStoryById(id);
            StoryViewModel storyViewModel = new StoryViewModel()
            {
                StoryModel = story
            };
            return PartialView(storyViewModel);
        }

        // GET: /Story/Add
        public ActionResult AddStoryRow()
        {
            StoryCollectionViewModel storyCollectionViewModel = new StoryCollectionViewModel();
            storyCollectionViewModel.ProjectId = 1;
            storyCollectionViewModel.AddStory = true;
            storyCollectionViewModel.SelectedSubMenuName = "Backlog";
            storyCollectionViewModel.Name = "Acme";  // TODO: Get this from current project
            ScrumTimeEntities entities = new ScrumTimeEntities();
            var results = from s in entities.Stories
                          orderby s.Priority ascending
                          select s;
            List<Story> stories = results.ToList<Story>();
            storyCollectionViewModel.Stories = stories;
            return View("ListByPriority", storyCollectionViewModel);
        }

        // POST: /Story/Save
        [HttpPost]
        public ActionResult Save(FormCollection collection)
        {
            try
            {
                string id = collection.Get("storyId");
                bool newStory = false;
                if (id == null)
                {
                    id = "0";
                    newStory = true;
                }
                string priority = collection.Get("priority");
                string originalPriority = collection.Get("originalPriority");
                string userDefinedId = collection.Get("userDefinedId");
                string narrative = collection.Get("narrative");
                string points = collection.Get("points");
                // TODO:  Validate the story data before saving
                // TODO:  Set the correct project id
                Story story = new Story()
                {
                    StoryId = Int32.Parse(id),
                    Narrative = narrative,
                    Points = Int32.Parse(points),
                    Priority = Int32.Parse(priority),
                    ProjectId = 1,
                    UserDefinedId = userDefinedId 
                };
                _StoryService.SaveStory(story);

                if (newStory)
                    return RedirectToAction("ListByPriority");
                else if (originalPriority != null && priority != originalPriority)
                    return RedirectToAction("ListByPriority", new { displayPartial = true });
                else
                    return RedirectToAction("ReadOnlyRow", new { id = Int32.Parse(id) });
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
            // TODO: Provide a caution prior to delete...use this GET delete to display a warning.
            return View();
        }

        //
        // POST: /Story/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                string idAsString = collection.Get("storyId");
                _StoryService.DeleteStory(Int32.Parse(idAsString));
                return RedirectToAction("ListByPriority", new { displayPartial = true });
            }
            catch
            {
                return View();
            }
        }

        /************* /\ *********************** Alizarin */



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

        
        
    }
}
