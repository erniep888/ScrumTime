using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.Services
{
    public class TaskService
    {
        ScrumTimeEntities _ScrumTimeEntities;

        public TaskService(ScrumTimeEntities scrumTimeEntities)
        {
            _ScrumTimeEntities = scrumTimeEntities;
        }


        public static Task GetTaskById(ScrumTimeEntities scrumTimeEntities, int id)
        {            
            Task task = null;
            var results = from t in scrumTimeEntities.Tasks
                          where t.TaskId == id
                          select t;
            if (results.Count() > 0)
                task = results.First<Task>();
            else
                task = new Task();
            return task;
        }

        public Task GetTaskById(int id)
        {
            return GetTaskById(_ScrumTimeEntities, id);
        }

        public Task SaveTask(Task task)
        {
            if (task != null)
            {
                if (task.TaskId == 0)  // this is new
                {
                    _ScrumTimeEntities.AddToTasks(task);
                }
                else  // the story exists
                {
                    _ScrumTimeEntities.AttachTo("Tasks", task);

                    ScrumTimeEntities freshScrumTimeEntities =
                        new ScrumTimeEntities(_ScrumTimeEntities.Connection.ConnectionString);
                    Task existingTask = GetTaskById(freshScrumTimeEntities, task.TaskId);
                    if (existingTask == null)
                    {
                        throw new Exception("The task no longer exists.");
                    }
                    _ScrumTimeEntities.ObjectStateManager.ChangeObjectState(task, System.Data.EntityState.Modified);
                }
                _ScrumTimeEntities.SaveChanges();
            }
            return task;
        }

        public void DeleteTask(int taskId)
        {
            Task existingTask = GetTaskById(taskId);

            if (existingTask != null && existingTask.TaskId > 0)
            {
                _ScrumTimeEntities.DeleteObject(existingTask);
                _ScrumTimeEntities.SaveChanges();
            }
            else
                throw new Exception("You have attempted to delete a task that does not exist.");
        }
    }
}