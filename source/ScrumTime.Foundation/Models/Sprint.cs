using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using ScrumTime.Foundation.Resources;

namespace ScrumTime.Foundation.Models
{
    public class Sprint
    {
        public int SprintId { get; set; }

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

        public int ProductId { get; set; }

        public virtual Product Product { get; set; }
        public virtual ICollection<Story> Stories { get; set; }
        public virtual ICollection<Scrum> Scrums { get; set; }

    }
}