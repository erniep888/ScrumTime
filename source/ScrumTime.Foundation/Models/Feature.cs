using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;
using ScrumTime.Foundation.Resources;

namespace ScrumTime.Foundation.Models
{
    public class Feature : IScrumTimeModel
    {
        public ObjectId Id { get; set; }
        public ObjectId ParentProductId { get; set; }

        public List<Artifact> Artifacts { get; set; }

        [Required(ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "NameRequired")]
        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "NameLength120")]
        public string Name { get; set; }

        [Required(ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "DescriptionRequired")]
        [MaxLength(1000, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "DescriptionLength1000")]
        public string Description { get; set; }

        [BsonIgnore]
        public Decimal HoursRemaining { get; set; }
        [BsonIgnore]
        public Decimal HoursCompleted { get; set; }
        [BsonIgnore]
        public Decimal UnbilledHours { get; set; }
        [BsonIgnore]
        public Decimal BilledHours { get; set; }

    }
}
