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
            else
                scrum = new Scrum();
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
                if (scrum.ScrumId == 0)  // this is new
                {
                    if (ScrumDateExists(scrum))
                        throw new Exception("Scrum for this Sprint already exists.");
                    _ScrumTimeEntities.AddToScrums(scrum);
                }
                else  // the scrum exists
                {
                    _ScrumTimeEntities.AttachTo("Scrums", scrum);
                    
                    ScrumTimeEntities freshScrumTimeEntities =
                        new ScrumTimeEntities(_ScrumTimeEntities.Connection.ConnectionString);
                    Scrum existingScrum = GetScrumById(freshScrumTimeEntities, scrum.ScrumId);
                    if (existingScrum == null)                    
                    {
                        throw new Exception("The story no longer exists.");
                    }
                    _ScrumTimeEntities.ObjectStateManager.ChangeObjectState(scrum, System.Data.EntityState.Modified);
                }
                _ScrumTimeEntities.SaveChanges();
            }
            return scrum;
        }

        public void DeleteScrum(int scrumId)
        {
            Scrum existingScrum = GetScrumById(scrumId);

            if (existingScrum != null && existingScrum.ScrumId > 0)
            {
                int totalStories = _ScrumTimeEntities.Scrums.Count();
                _ScrumTimeEntities.DeleteObject(existingScrum);
            }
            else
                throw new Exception("You have attempted to delete a scrum that does not exist.");
        }

        protected bool ScrumDateExists(Scrum scrum)
        {
            var results = from s in _ScrumTimeEntities.Scrums
                          where s.DateOfScrum == scrum.DateOfScrum &&
                          s.SprintId == scrum.SprintId
                          select s;
            return (results.Count() > 0) ? true : false;
        }

    }
}