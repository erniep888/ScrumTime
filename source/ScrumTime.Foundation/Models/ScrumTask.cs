using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using ScrumTime.Foundation.Resources;
using MongoDB.Bson;


namespace ScrumTime.Foundation.Models
{
    public class ScrumTask
    {
        public ObjectId ParentScrumId { get; set; }
        public ObjectId OwningTaskId { get; set; }

        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "AssignedToMaxLength120")]
        [Required(ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "AssignedToRequired")]
        public string AssignedTo { get; set; }

        [Range(0.0d, 40.0d, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "HoursCompletedRange0_40")]
        public decimal HoursCompleted { get; set; }

        [Range(0.0d, 40.0d, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "HoursRemainingRange0_40")]
        public decimal HoursRemaining { get; set; }
    }
}