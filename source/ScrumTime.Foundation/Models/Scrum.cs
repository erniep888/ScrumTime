using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;

namespace ScrumTime.Foundation.Models
{
    public class Scrum
    {
        [Display(Name = "Scrum")]
        public int ScrumId { get; set; }

        [Display(Name = "Product")]
        public int ProductId { get; set; }

        [Display(Name = "Sprint")]
        public int SprintId { get; set; }

        public virtual Product Product { get; set; }
        public virtual Sprint Sprint { get; set; }
        public virtual ICollection<ScrumTask> ScrumDetails { get; set; }

    }
}