using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.Services
{
    public class SprintService
    {
        ScrumTimeEntities _ScrumTimeEntities;

        public SprintService(ScrumTimeEntities scrumTimeEntities)
        {
            _ScrumTimeEntities = scrumTimeEntities;
        }


        // if there are any sprints that end after or equal to the startDate
        // make sure to include them in the results.  Conversely, if there
        // are any sprints that begin after the endDate, do not include them.
        public List<Sprint> GetSprintsWithinDateRange(DateTime startDate, DateTime endDate)
        {
            var results = from s in _ScrumTimeEntities.Sprints
                          where (s.StartDate.CompareTo(startDate) < 0 && s.FinishDate.CompareTo(endDate) > 0) ||  // spans range
                                (s.StartDate.CompareTo(startDate) > 0 && s.FinishDate.CompareTo(endDate) < 0) ||  // within range
                                (s.StartDate.CompareTo(startDate) < 0 && 
                                    s.FinishDate.CompareTo(startDate) > 0 && s.FinishDate.CompareTo(endDate) < 0) || // finish in range
                                (s.StartDate.CompareTo(startDate) > 0 &&
                                    s.StartDate.CompareTo(endDate) < 0 && s.FinishDate.CompareTo(endDate) > 0)  // start in range
                          orderby s.StartDate ascending
                          select s;
            return results.ToList<Sprint>();
        }

        public List<Sprint> GetSprintsByFinishDateDesc(int productId)
        {
            var results = from s in _ScrumTimeEntities.Sprints
                          orderby s.FinishDate descending
                          select s;
            return results.ToList<Sprint>();
        }

        public static Sprint GetSprintById(ScrumTimeEntities scrumTimeEntities, int id)
        {
            Sprint sprint = null;
            var results = from t in scrumTimeEntities.Sprints
                          where t.SprintId == id
                          select t;
            if (results.Count() > 0)
                sprint = results.First<Sprint>();
            else
                sprint = new Sprint();
            return sprint;
        }

        public static List<Sprint> GetAllSprints(ScrumTimeEntities scrumTimeEntities,
                int productId)
        {
            var results = from t in scrumTimeEntities.Sprints
                          where t.ProductId == productId
                          orderby t.FinishDate descending
                          select t;
            return results.ToList<Sprint>();
        }

        public Sprint GetSprintById(int id)
        {
            return GetSprintById(_ScrumTimeEntities, id);
        }

        public Sprint SaveSprint(Sprint sprint)
        {
            if (sprint != null)
            {
                if (sprint.SprintId == 0)  // this is new
                {
                    _ScrumTimeEntities.AddToSprints(sprint);
                }
                else  // the sprint exists
                {
                    _ScrumTimeEntities.AttachTo("Sprints", sprint);

                    ScrumTimeEntities freshScrumTimeEntities =
                        new ScrumTimeEntities(_ScrumTimeEntities.Connection.ConnectionString);
                    Sprint existingSprint = GetSprintById(freshScrumTimeEntities, sprint.SprintId);
                    if (existingSprint == null)
                    {
                        throw new Exception("The sprint no longer exists.");
                    }
                    _ScrumTimeEntities.ObjectStateManager.ChangeObjectState(sprint, System.Data.EntityState.Modified);
                }
                _ScrumTimeEntities.SaveChanges();
            }
            return sprint;
        }

        public void DeleteSprint(int sprintId)
        {
            Sprint existingSprint = GetSprintById(sprintId);

            if (existingSprint != null && existingSprint.SprintId > 0)
            {
                _ScrumTimeEntities.DeleteObject(existingSprint);
                _ScrumTimeEntities.SaveChanges();
            }
            else
                throw new Exception("You have attempted to delete a sprint that does not exist.");
        }

    }
}