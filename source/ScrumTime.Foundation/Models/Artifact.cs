using System;
using System.ComponentModel.DataAnnotations;
using ScrumTime.Foundation.Resources;

namespace ScrumTime.Foundation.Models
{
    public class Artifact
    {
        public int ArtifactId { get; set; }

        [Required(ErrorMessageResourceType=typeof(CommonResources),
            ErrorMessageResourceName = "DescriptionRequired")]
        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "DescriptionLength120")]
        public String Description { get; set; }

        [Required(ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "FileNameRequired")]
        public String FileName { get; set; }

        [Required()]
        public String ServerFilePath { get; set; }

        [Required()]
        public String ServerFileName { get; set; }

        [Required()]
        public String ContentType { get; set; }

        [Required()]
        public long Size { get; set; }
    }
}
