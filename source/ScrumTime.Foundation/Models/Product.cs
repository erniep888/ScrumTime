using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using MongoDB.Driver.Builders;
using MongoDB.Bson.Serialization.Attributes;
using ScrumTime.Foundation.Resources;


namespace ScrumTime.Foundation.Models
{
    public class Product : IScrumTimeModel
    {
        public ObjectId Id { get; set; }

        public Artifact Photo { get; set; }

        public List<Artifact> Artifacts { get; set; }

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

        //public List<Feature> Features { get; set; }
        //public virtual ICollection<Release> Releases { get; set; }
        //public virtual ICollection<Team> Teams { get; set; }
    }
}