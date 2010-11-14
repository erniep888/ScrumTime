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
    public partial class TaskController : Controller
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

        // An AJAX driven result that replaces the story row with a story row + task backlog
        [Authorize]
        public virtual ActionResult StoryTaskBacklog(int storyId)
        {
            TaskCollectionViewModel taskCollectionViewModel = TaskCollectionViewModel.BuildByIdAsc(storyId);
            return PartialView(taskCollectionViewModel);
        }

        // An AJAX driven result that returns just the tbody of the task backlog for the given story
        [Authorize]
        public virtual ActionResult ListById(int storyId)
        {
            TaskCollectionViewModel taskCollectionViewModel = TaskCollectionViewModel.BuildByIdAsc(storyId);
            return PartialView("List", taskCollectionViewModel);
        }

        // An AJAX driven result that returns just the td's of the editable task...replaces read only
        [Authorize]
        public virtual ActionResult Edit(int id)
        {
            Task task = _TaskService.GetTaskById(id);
            return PartialView(task);
        }

        // An AJAX driven result that returns just the td's of the read only task...replaces any other
        [Authorize]
        public virtual ActionResult ReadOnly(int id)
        {
            Task task = _TaskService.GetTaskById(id);
            return PartialView(task);
        }

        // An AJAX driven result that returns just the td's of the editable "new" task...appends to list
        [Authorize]
        public virtual ActionResult New(int storyId)
        {
            Story story = _StoryService.GetStoryById(storyId);
            Task task = new Task()
            {
                Hours = 0,
                StoryId = storyId,
                TaskId = 0
            };
            return PartialView("Edit", task);
        }

        [Authorize]
        [HttpPost]
        public virtual ActionResult TotalTaskHours(int storyId)
        {
            var tasks = _TaskService.GetTasksByStoryIdOrderbyIdAsc(storyId);
            return Json(tasks.Sum(t => t.Hours));
        }

        // POST: /Task/Save
        [Authorize]
        [HttpPost]
        public virtual ActionResult Save(FormCollection collection)
        {
            try
            {
                string storyId = collection.Get("storyId");
                string id = collection.Get("taskId");
                bool newTask = false;
                if (id == null || id == "0")
                {
                    id = "0";
                    newTask = true;
                }
                string description = collection.Get("description");
                string hours = collection.Get("hours");
                // TODO:  Validate the story data before saving
                // TODO:  Set the correct product id
                Task task = new Task()
                {
                    TaskId = Int32.Parse(id),
                    StoryId = Int32.Parse(storyId),
                    Description = description,
                    Hours = decimal.Parse(hours),                    
                };
                _TaskService.SaveTask(task);

                if (newTask)
                    return RedirectToAction("ListById", new { storyId = storyId });
                else
                    return RedirectToAction("ReadOnly", new { id = Int32.Parse(id) });
            }
            catch
            {
                return View();  // TODO:  Handle displaying the exception condition
            }
        }

        //
        // POST: /Task/Delete/5
        [Authorize]
        [HttpPost]
        public virtual ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                string storyId = collection.Get("storyId");
                string idAsString = collection.Get("taskId");
                _TaskService.DeleteTask(Int32.Parse(idAsString));
                return RedirectToAction("ListById", new { storyId = storyId });
            }
            catch
            {
                return View();
            }
        }

    }
}
