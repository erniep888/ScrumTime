using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using MongoDB.Bson;

namespace ScrumTime.Foundation.Models
{
    public class Scrum
    {
        public ObjectId ParentSprintId { get; set; }

        public DateTime DateTimeOfScrum { get; set; }
        public List<ScrumTask> ScrumDetails { get; set; }

    }
}