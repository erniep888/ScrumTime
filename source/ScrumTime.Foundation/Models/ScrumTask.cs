using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using ScrumTime.Foundation.Resources;


namespace ScrumTime.Foundation.Models
{
    public class ScrumTask
    {
        public int ScrumTaskId { get; set; }

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

        public int ScrumId { get; set; }

        public int TaskId { get; set; }

        public virtual Scrum ParentScrum { get; set; }
        public virtual Task Task { get; set; }
    }
}