using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ScrumTime.Foundation.Models
{
    public class Product
    {
        [Display(Name = "Product")]
        public int ProductId { get; set; }

        [MaxLength(120, ErrorMessage = "Name may not be more than 120 characters long.")]
        [Required(ErrorMessage = "Name is required.")]
        public string Name { get; set; }

        [MaxLength(1000, ErrorMessage = "Description may not be more than 1000 characters long.")]
        [Required(ErrorMessage = "Description is required.")]
        public string Description { get; set; }

        public virtual List<Release> Releases { get; set; }

        // public virtual ICollection<Story> Stories { get; set; }
        //public virtual ICollection<Sprint> Sprints { get; set; }
        //public virtual ICollection<Scrum> Scrums { get; set; }


    }
}