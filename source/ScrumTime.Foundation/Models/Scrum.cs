using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;

namespace ScrumTime.Foundation.Models
{
    public class Scrum
    {
        public int ScrumId { get; set; }

        [Required()]
        public int SprintId { get; set; }

        public virtual Sprint Sprint { get; set; }
        public virtual ICollection<ScrumTask> ScrumDetails { get; set; }

    }
}