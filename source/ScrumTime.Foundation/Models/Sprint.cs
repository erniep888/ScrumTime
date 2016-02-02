using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using ScrumTime.Foundation.Resources;
using MongoDB.Bson;

namespace ScrumTime.Foundation.Models
{
    public class Sprint : IScrumTimeModel
    {
        public ObjectId Id { get; set; }
        public ObjectId ParentProductId { get; set; }

        public List<ObjectId> AssignedStoryIds { get; set; }

        public List<Scrum> Scrums { get; set; }

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

        public DateTime StartDate { get; set; }
        
        public DateTime FinishDate { get; set; }
    }
}