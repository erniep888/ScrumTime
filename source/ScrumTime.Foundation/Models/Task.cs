using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;

namespace ScrumTime.Foundation.Models
{
    public class Task
    {
        [Display(Name = "Task")]
        public int TaskId { get; set; }

        //[MaxLength(500 ,ErrorMessage = "Description may not be more than 500 characters long.")]
        [Required(ErrorMessage = "Description is required.")]
        public string Description { get; set; }

        [Range(0.0d, 40.0d, ErrorMessage = "Hours must be between 0.0 and 40.0 hours.")]
        public decimal Hours { get; set; }

        [MaxLength(128, ErrorMessage = "Assigned To may not be more than 128 characters long.")]
        [Required(ErrorMessage = "Assigned To is required.")]
        [Display(Name = "Assigned To")]
        public string AssignedTo { get; set; }

        [Display(Name = "Story")]
        public int StoryId { get; set; }

        public virtual Story Story { get; set; }
        //public virtual ICollection<ScrumDetail> ScrumDetails { get; set; }
    }
}