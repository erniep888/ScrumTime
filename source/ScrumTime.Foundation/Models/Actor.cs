using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;
using ScrumTime.Foundation.Resources;

namespace ScrumTime.Foundation.Models
{
    public class Actor
    {
        public int ActorId { get; set; }

        [Required(ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "NameRequired")]
        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "NameLength120")]        
        public String Name { get; set; }

        [EmailAddress()]
        public String Email { get; set; }
    }
}
