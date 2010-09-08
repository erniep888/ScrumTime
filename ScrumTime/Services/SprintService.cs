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
                          orderby s.StartDate
                          select s;
            return results.ToList<Sprint>();
        }

    }
}