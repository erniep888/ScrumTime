using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Driver.Linq;
using ScrumTime.Foundation.Models;

namespace ScrumTime.Foundation.DataAccessLayer
{
    public class BugRepository : BaseRepository<Bug>
    {

        public BugRepository()
            : base("Bugs")
        {
        }

        public void SetDefaultBugPriorities()
        {
            var priorities = scrumTimeContext.BugPriorities().AsQueryable<BugPriority>();
            if (priorities.SingleOrDefault(m => m.Name == "Low") == null)
                scrumTimeContext.BugPriorities().Insert(new BugPriority() { Name = "Low", NumericValue = 100 });            
            if (priorities.SingleOrDefault(m => m.Name == "Normal") == null)
                scrumTimeContext.BugPriorities().Insert(new BugPriority() { Name = "Normal", NumericValue = 50 });
            if (priorities.SingleOrDefault(m => m.Name == "High") == null)
                scrumTimeContext.BugPriorities().Insert(new BugPriority() { Name = "High", NumericValue = 10 });
            if (priorities.SingleOrDefault(m => m.Name == "Urgent") == null)
                scrumTimeContext.BugPriorities().Insert(new BugPriority() { Name = "Urgent", NumericValue = 1 });
        }

        public void SetDefaultBugSeverities()
        {
            var severities = scrumTimeContext.BugSeverities().AsQueryable<BugSeverity>();
            if (severities.SingleOrDefault(m => m.Name == "Trivial") == null)
                scrumTimeContext.BugSeverities().Insert(new BugSeverity() { Name = "Trivial", NumericValue = 100 });
            if (severities.SingleOrDefault(m => m.Name == "Minor") == null)
                scrumTimeContext.BugSeverities().Insert(new BugSeverity() { Name = "Minor", NumericValue = 50 });
            if (severities.SingleOrDefault(m => m.Name == "Major") == null)
                scrumTimeContext.BugSeverities().Insert(new BugSeverity() { Name = "Major", NumericValue = 10 });
            if (severities.SingleOrDefault(m => m.Name == "Blocking") == null)
                scrumTimeContext.BugSeverities().Insert(new BugSeverity() { Name = "Blocking", NumericValue = 1 });
        }

        public void SetDefaultBugStatuses()
        {
            var statuses = scrumTimeContext.BugStatuses().AsQueryable<BugStatus>();
            if (statuses.SingleOrDefault(m => m.Name == "New") == null)
                scrumTimeContext.BugStatuses().Insert(new BugStatus() { Name = "New", NumericValue = 100 });
            if (statuses.SingleOrDefault(m => m.Name == "Feedback") == null)
                scrumTimeContext.BugStatuses().Insert(new BugStatus() { Name = "Feedback", NumericValue = 95 });
            if (statuses.SingleOrDefault(m => m.Name == "Acknowledged") == null)
                scrumTimeContext.BugStatuses().Insert(new BugStatus() { Name = "Acknowledged", NumericValue = 90 });
            if (statuses.SingleOrDefault(m => m.Name == "Confirmed") == null)
                scrumTimeContext.BugStatuses().Insert(new BugStatus() { Name = "Confirmed", NumericValue = 70 });
            if (statuses.SingleOrDefault(m => m.Name == "Assigned") == null)
                scrumTimeContext.BugStatuses().Insert(new BugStatus() { Name = "Assigned", NumericValue = 50 });
            if (statuses.SingleOrDefault(m => m.Name == "On Hold") == null)
                scrumTimeContext.BugStatuses().Insert(new BugStatus() { Name = "On Hold", NumericValue = 40 });
            if (statuses.SingleOrDefault(m => m.Name == "Resolved") == null)
                scrumTimeContext.BugStatuses().Insert(new BugStatus() { Name = "Resolved", NumericValue = 20 });
            if (statuses.SingleOrDefault(m => m.Name == "Closed") == null)
                scrumTimeContext.BugStatuses().Insert(new BugStatus() { Name = "Closed", NumericValue = 10 });
            
        }
    }
}
