using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using ScrumTime.Foundation.Resources;

namespace ScrumTime.Foundation.Models
{
    public class Story
    {
        public int StoryId { get; set; }

        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "NameLength120")]
        public string Name { get; set; }

        [Required(ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "NarrativeRequired")]
        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "NarrativeLength1000")]
        public string Narrative { get; set; }

        [Range(0, 100, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "Points0_100")]
        public int Points { get; set; }

        public int Priority { get; set; }

        public int SprintId { get; set; }
        public virtual Sprint Sprint { get; set; }

        public virtual ICollection<Task> Tasks { get; set; }

    }
}