using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;

namespace ScrumTime.Foundation.Models
{
    public class Team : IScrumTimeModel
    {
        public ObjectId Id { get; set; }

        public ObjectId ParentProductId { get; set; }

        public Artifact Photo { get; set; }

        public List<Artifact> Artifacts { get; set; }
    }
}
