using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson.Serialization.Attributes;

namespace ScrumTime.Foundation.Models
{
    public class BugSeverity
    {
        [BsonId]
        public String Name { get; set; }

        public int NumericValue { get; set; }
    }
}
