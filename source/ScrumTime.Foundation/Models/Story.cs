using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;

namespace ScrumTime.Foundation.Models
{
    public class Story
    {
        [Display(Name = "Story")]
        public int StoryId { get; set; }

        [MaxLength(1000, ErrorMessage = "Narrative may not be more than 1000 characters long.")]
        [Required(ErrorMessage = "Narrative is required.")]
        public string Narrative { get; set; }

        [Range(0, 100, ErrorMessage = "Points must be between 0 and 100.")]
        public int Points { get; set; }

        public int Priority { get; set; }

        [Display(Name = "Product")]
        public int ProductId { get; set; }

        [Display(Name = "Sprint")]
        public int SprintId { get; set; }

        public virtual Product Product { get; set; }
        //public virtual Sprint Sprint { get; set; }
        public virtual ICollection<Task> Tasks { get; set; }

    }
}