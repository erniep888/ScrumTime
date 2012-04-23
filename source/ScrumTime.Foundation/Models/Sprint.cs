using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;

namespace ScrumTime.Foundation.Models
{
    public class Sprint
    {
        [Display(Name = "Sprint")]
        public int SprintId { get; set; }

        [MaxLength(120, ErrorMessage = "Name may not be more than 120 characters long.")]
        [Required(ErrorMessage = "Name is required.")]
        public string Name { get; set; }

        [MaxLength(1000, ErrorMessage = "Description may not be more than 1000 characters long.")]
        [Required(ErrorMessage = "Description is required.")]
        public string Description { get; set; }

        [Display(Name = "Start Date")]
        public DateTime StartDate { get; set; }
        
        [Display(Name = "Finish Date")]
        public DateTime FinishDate { get; set; }

        [Display(Name = "Product")]
        public int ProductId { get; set; }

        public virtual Product Product { get; set; }
        public virtual ICollection<Story> Stories { get; set; }
        public virtual ICollection<Scrum> Scrums { get; set; }

    }
}