using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;

namespace ScrumTime.Foundation.Models
{
    public class Bug : IScrumTimeModel
    {        
        public ObjectId Id { get; set; }

        public ObjectId ReporterId { get; set; }
        public ObjectId AssignedToId { get; set; }

        public List<Artifact> Artifacts { get; set; }
        public List<ObjectId> RelatedBugs { get; set; }

        public String BugPriority { get; set; }
        public String BugStatus { get; set; }
        public String BugSeverity { get; set; }

        public String Summary { get; set; }
        public String Description { get; set; }
        public String StepsToReproduce { get; set; }
    }
}
