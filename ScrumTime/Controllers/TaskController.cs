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

        public ActionResult ListById(int storyId)
        {
            ScrumTimeEntities entities = new ScrumTimeEntities();
            Story story = _StoryService.GetStoryById(storyId);
            TaskCollectionViewModel taskCollectionViewModel = new TaskCollectionViewModel()
            {
                ParentStoryModel = story
            };
            return PartialView(taskCollectionViewModel);
        }

        public ActionResult StoryRowWithTasks(int storyId)
        {
            ScrumTimeEntities entities = new ScrumTimeEntities();
            Story story = _StoryService.GetStoryById(storyId);
            TaskCollectionViewModel taskCollectionViewModel = new TaskCollectionViewModel()
            {
                ParentStoryModel = story
            };
            return PartialView(taskCollectionViewModel);
        }

        public ActionResult Edit(int id)
        {
            Task task = _TaskService.GetTaskById(id);
            return PartialView(task);
        }

        public ActionResult ReadOnly(int id)
        {
            Task task = _TaskService.GetTaskById(id);
            return PartialView(task);
        }

        // GET: /Task/AddTaskRow
        public ActionResult AddTaskRow(int storyId)
        {
            ScrumTimeEntities entities = new ScrumTimeEntities();
            Story story = _StoryService.GetStoryById(storyId);
            TaskCollectionViewModel taskCollectionViewModel = new TaskCollectionViewModel()
            {
                ParentStoryModel = story, AddTask = true
            };
            return PartialView("ListById", taskCollectionViewModel);
        }

        // POST: /Task/Save
        [HttpPost]
        public ActionResult Save(FormCollection collection)
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
                // TODO:  Set the correct project id
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
                    return RedirectToAction("ReadOnlyRow", new { id = Int32.Parse(id) });
            }
            catch
            {
                return View();  // TODO:  Handle displaying the exception condition
            }
        }

        //
        // POST: /Task/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
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
