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


        public Task GetTaskById(ScrumTimeEntities scrumTimeEntities, int id)
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
    }
}