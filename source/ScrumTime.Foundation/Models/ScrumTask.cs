using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ScrumTime.Foundation.Models
{
    public class ScrumTask
    {
        [Display(Name = "Scrum Task")]
        public int ScrumTaskId { get; set; }

       //[MaxLength(128, ErrorMessage = "Assigned To may not be more than 128 characters long.")]
        [Required(ErrorMessage = "Assigned To is required.")]
        [Display(Name = "Assigned To")]
        public string AssignedTo { get; set; }

        [Range(0.0d, 40.0d, ErrorMessage="Hours Completed must be between 0.0 and 40.0 hours.")]
        public decimal HoursCompleted { get; set; }

        [Range(0.0d, 40.0d, ErrorMessage = "Hours Remaining must be between 0.0 and 40.0 hours.")]
        public decimal HoursRemaining { get; set; }

        [Display(Name = "Scrum")]
        public int ScrumId { get; set; }

        [Display(Name = "Task")]
        public int TaskId { get; set; }

        public virtual Scrum Scrum { get; set; }
        public virtual Task Task { get; set; }
    }
}