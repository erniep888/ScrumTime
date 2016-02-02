using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using ScrumTime.Foundation.Resources;
using MongoDB.Bson;

namespace ScrumTime.Foundation.Models
{
    public class Release : IScrumTimeModel
    {
        public ObjectId Id { get; set; }
        public ObjectId ParentProductId { get; set; }
        public ObjectId SprintIdsIncluded { get; set; }

        public Artifact Photo { get; set; }
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

        public DateTime TargetDate { get; set; }

    }
}