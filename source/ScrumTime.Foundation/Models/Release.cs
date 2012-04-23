using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;

namespace ScrumTime.Foundation.Models
{
    public class Release
    {
        [Display(Name = "Release")]
        public int ReleaseId { get; set; }

        [MaxLength(120, ErrorMessage = "Name may not be more than 120 characters long.")]
        [Required(ErrorMessage = "Name is required.")]
        public string Name { get; set; }

        [MaxLength(1000, ErrorMessage = "Description may not be more than 1000 characters long.")]
        [Required(ErrorMessage = "Description is required.")]
        public string Description { get; set; }

        public DateTime TargetDate { get; set; }
        
        public virtual Product Product { get; set; }

    }
}