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

        // The backlog is the entire html page
        [Authorize]
        public ActionResult BacklogByPriority()
        {
            // TODO: Pull the actual product information from session before 0.9 release
            StoryCollectionViewModel storyCollectionViewModel = StoryCollectionViewModel.BuildByPriorityAsc(1);
            return PartialView("Backlog", storyCollectionViewModel);
        }

        // The list is the sub-section of the page that contains only the table of story read only rows
        [Authorize]
        public ActionResult ListByPriority()
        {
            // TODO: Pull the actual product information from session before 0.9 release
            StoryCollectionViewModel storyCollectionViewModel = StoryCollectionViewModel.BuildByPriorityAsc(1);           
            return PartialView("List", storyCollectionViewModel);
        }

        // Returns only one read only row
        [Authorize]
        public ActionResult ReadOnly(int id)
        {
            Story story = _StoryService.GetStoryById(id);
            return PartialView(story);
        }

        // Returns only one edit row
        [Authorize]
        public ActionResult Edit(int id)
        {
            List<Sprint> allSprints = SprintService.GetAllSprints(_ScrumTimeEntities,
                SessionHelper.GetCurrentProductId(User.Identity.Name, Session));
            Sprint noneSprint = new Sprint()
            {
                Name = "None",
                SprintId = -1
            };
            allSprints.Insert(0, noneSprint);
            Story story = _StoryService.GetStoryById(id);
            StoryViewModel storyViewModel = new StoryViewModel()
            {
                StoryModel = story,
                AllSprints = allSprints
            };
            return PartialView(storyViewModel);
        }

        // Returns only one new row
        [Authorize]
        public ActionResult New()
        {
            List<Sprint> allSprints = SprintService.GetAllSprints(_ScrumTimeEntities,
                SessionHelper.GetCurrentProductId(User.Identity.Name, Session));
            Sprint noneSprint = new Sprint()
            {
                Name = "None",
                SprintId = -1
            };
            allSprints.Insert(0, noneSprint);
            // TODO: Pull the actual product information from session before 0.9 release
            Product product = _ScrumTimeEntities.Products.First<Product>(p => p.ProductId == 1);
            StoryViewModel storyViewModel = new StoryViewModel()
            {
                StoryModel = new Story()
                {
                    StoryId = 0,
                    Narrative = "As a ...",
                    Points = 0,
                    Priority = 0,
                    UserDefinedId = (product.Stories.Count() + 1).ToString()
                },
                AllSprints = allSprints
            };
            return PartialView("Edit", storyViewModel);
        }

        // POST: /Story/Save
        [Authorize]
        [HttpPost]
        public ActionResult Save(FormCollection collection)
        {
            try
            {
                string id = collection.Get("storyId");
                bool newStory = false;
                if (id == null || id == "0")
                {
                    id = "0";
                    newStory = true;
                }
                string priority = collection.Get("priority");
                string originalPriority = collection.Get("originalPriority");
                string userDefinedId = collection.Get("userDefinedId");
                string narrative = collection.Get("narrative");
                string points = collection.Get("points");
                string sprintId = collection.Get("sprintId");
                int? sprintIdAsInt = (sprintId == null) ? null : (int?)Int32.Parse(sprintId);
                sprintIdAsInt = (sprintIdAsInt != null && sprintIdAsInt > 0) ? sprintIdAsInt : null;
                // TODO:  Validate the story data before saving
                // TODO:  Set the correct product id
                Story story = new Story()
                {
                    StoryId = Int32.Parse(id),
                    Narrative = narrative,
                    Points = Int32.Parse(points),
                    Priority = Int32.Parse(priority),
                    ProductId = 1,
                    UserDefinedId = userDefinedId,
                    SprintId = sprintIdAsInt
                };
                _StoryService.SaveStory(story);

                if (newStory || (priority != originalPriority))
                    return RedirectToAction("ListByPriority");
                else
                    return RedirectToAction("ReadOnly", new { id = Int32.Parse(id) });
            }
            catch
            {
                return View();  // TODO:  Handle displaying the exception condition
            }
        }

        //
        // GET: /Story/Delete/5
        [Authorize]
        public ActionResult Delete(int id)
        {
            // TODO: Provide a caution prior to delete...use this GET delete to display a warning.
            return View();
        }

        //
        // POST: /Story/Delete/5
        [Authorize]
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

        // Returns only a small table for the story actions
        [Authorize]
        public ActionResult StoryActionCancelOnly(int storyId)
        {
            Story story = _StoryService.GetStoryById(storyId);
            return PartialView(story);
        }

   
        // Returns the entire Backlog html page
        [Authorize]
        public ActionResult Index()
        {
            return RedirectToAction("BacklogByPriority");
        }

    }
}
