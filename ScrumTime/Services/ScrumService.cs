using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.Services
{
    public class ScrumService
    {
        ScrumTimeEntities _ScrumTimeEntities;

        public ScrumService(ScrumTimeEntities scrumTimeEntities)
        {
            _ScrumTimeEntities = scrumTimeEntities;
        }


        public static Scrum GetScrumById(ScrumTimeEntities scrumTimeEntities, int id)
        {            
            Scrum scrum = null;
            var results = from s in scrumTimeEntities.Scrums
                          where s.ScrumId == id
                          select s;
            if (results.Count() > 0)
                scrum = results.First<Scrum>();
            return scrum;
        }

        public static Scrum GetScrumByDateOfScrumAndSprintId(ScrumTimeEntities scrumTimeEntities, 
            DateTime dateOfScrum, int sprintId)
        {
            Scrum scrum = null;
            var results = from s in scrumTimeEntities.Scrums
                          where s.DateOfScrum == dateOfScrum &&
                          s.SprintId == sprintId
                          select s;
            if (results.Count() > 0)
                scrum = results.First<Scrum>();
            return scrum;
        }

        public Scrum GetScrumById(int id)
        {
            return GetScrumById(_ScrumTimeEntities, id);
        }

        public Scrum SaveScrum(Scrum scrum)
        {
            if (scrum != null)
            {
                if (scrum.ScrumId == 0 && !ScrumDateExists(scrum))  // this is new
                {
                    _ScrumTimeEntities.AddToScrums(scrum);
                }
                else  // the scrum exists
                {
                    if (scrum.ScrumId == 0)  // the scrum matches an existing date
                    {
                        ScrumTimeEntities freshScrumTimeEntities =
                            new ScrumTimeEntities(_ScrumTimeEntities.Connection.ConnectionString);
                        Scrum scrumByDate = GetScrumByDateOfScrumAndSprintId(freshScrumTimeEntities,
                            scrum.DateOfScrum, scrum.SprintId);
                        DeleteScrum(freshScrumTimeEntities, scrumByDate.ScrumId);
                    }
                    else  // the scrum matches an existing scrum id
                    {                       
                        ScrumTimeEntities freshScrumTimeEntities =
                            new ScrumTimeEntities(_ScrumTimeEntities.Connection.ConnectionString);
                        Scrum existingScrum = GetScrumById(freshScrumTimeEntities, scrum.ScrumId);
                        DeleteScrum(freshScrumTimeEntities, existingScrum.ScrumId);
                    }
                    _ScrumTimeEntities.AddToScrums(scrum);
                }
                _ScrumTimeEntities.SaveChanges();
            }
            return scrum;
        }

        public void DeleteScrum(ScrumTimeEntities scrumTimeEntities, int scrumId)
        {
            Scrum existingScrum = GetScrumById(scrumTimeEntities, scrumId);

            if (existingScrum != null && existingScrum.ScrumId > 0)
            {
                List<ScrumDetail> scrumDetails = existingScrum.ScrumDetails.ToList<ScrumDetail>();
                foreach (ScrumDetail scrumDetail in scrumDetails)
                {
                    scrumTimeEntities.DeleteObject(scrumDetail);
                }
                scrumTimeEntities.DeleteObject(existingScrum);
                scrumTimeEntities.SaveChanges();
            }
            else
                throw new Exception("You have attempted to delete a scrum that does not exist.");
        }

        public void DeleteScrum(int scrumId)
        {
            DeleteScrum(_ScrumTimeEntities, scrumId);
        }

        protected Scrum GetMostRecentScrum(Sprint sprint)
        {
            Scrum mostRecentScrum = null;
            DateTime maxScrumDate = DateTime.MinValue;
            if (sprint.Scrums != null && sprint.Scrums.Count() > 0)
                maxScrumDate = sprint.Scrums.Max(s => s.DateOfScrum);
            if (maxScrumDate.CompareTo(DateTime.MinValue) > 0)
                mostRecentScrum = GetScrumByDateOfScrumAndSprintId(_ScrumTimeEntities, maxScrumDate, sprint.SprintId);
            return mostRecentScrum;
        }

        protected ScrumDetail BuildScrumDetail(Sprint sprint, Task task)
        {
            Scrum mostRecentScrum = GetMostRecentScrum(sprint);
            ScrumDetail mostRecentScrumDetail = null;
            if (mostRecentScrum != null && mostRecentScrum.ScrumDetails.Count() > 0)
            {
                var results = from s in mostRecentScrum.ScrumDetails
                              where s.TaskId == task.TaskId
                              select s;
                if (results.Count() > 0)
                    mostRecentScrumDetail = results.First();
            }
            ScrumDetail scrumDetail = new ScrumDetail()
            {
                AssignedTo = (mostRecentScrumDetail != null) ? mostRecentScrumDetail.AssignedTo : AccountMembershipService.UNASSIGNED,
                HoursCompleted = (mostRecentScrumDetail != null) ? mostRecentScrumDetail.HoursCompleted : 0,
                HoursRemaining = (mostRecentScrumDetail != null) ? mostRecentScrumDetail.HoursRemaining :
                    ( (task.Hours != null) ? (int)task.Hours : 0 ),
                StoryTaskDescription = task.Story.UserDefinedId + " -> " + task.Description,
                TaskId = task.TaskId
            };
            return scrumDetail;
        }

        public Scrum GenerateNewScrumDetails(int sprintId, Scrum scrum)
        {
            SprintService sprintService = new SprintService(_ScrumTimeEntities);
            Sprint sprint = sprintService.GetSprintById(sprintId);
            if (sprint != null)
            {
                foreach (Story story in sprint.Stories)
                {
                    foreach (Task task in story.Tasks)
                    {
                        ScrumDetail scrumDetail = BuildScrumDetail(sprint, task);
                        scrum.ScrumDetails.Add(scrumDetail);
                    }
                }
            }
            return scrum;
        }

        protected bool ScrumDateExists(Scrum scrum)
        {
            var results = from s in _ScrumTimeEntities.Scrums
                          where s.DateOfScrum == scrum.DateOfScrum &&
                          s.SprintId == scrum.SprintId
                          select s;
            return (results.Count() > 0) ? true : false;
        }

        public List<Scrum> GetScrumsBySprintId(int sprintId)
        {            
            var results = from s in _ScrumTimeEntities.Scrums
                          where s.SprintId == sprintId
                          orderby s.DateOfScrum ascending
                          select s;
            return results.ToList<Scrum>();
        }

        public decimal GetMaxTaskHourCountBySprintId(int sprintId)
        {
            decimal maxCount = 0;
            var results = from s in _ScrumTimeEntities.Scrums
                          where s.SprintId == sprintId
                          orderby s.DateOfScrum ascending
                          select s;
            if (results != null && results.Count() > 0)
            {
                var targetScrum = results.First();
                maxCount = targetScrum.ScrumDetails.Max(m => m.HoursRemaining);
            }
            return maxCount;
        }

    }
}