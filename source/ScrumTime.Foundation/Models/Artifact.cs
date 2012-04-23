using System;
using System.ComponentModel.DataAnnotations;

namespace ScrumTime.Foundation.Models
{
    public class Artifact
    {        
        [MaxLength(120, ErrorMessage = "Name may not be more than 120 characters long.")]
        [Required(ErrorMessage = "Name is required.")]
        public String Description { get; set; }
        public String FileName { get; set; }
        public String ServerFilePath { get; set; }
        public String ServerFileName { get; set; }
    }
}
