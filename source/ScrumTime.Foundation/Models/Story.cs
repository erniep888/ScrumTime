using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using ScrumTime.Foundation.Resources;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace ScrumTime.Foundation.Models
{
    public class Story
    {
        public ObjectId Id { get; set; }

        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "NameLength120")]
        public string Name { get; set; }

        [Required(ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "NarrativeRequired")]
        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "NarrativeLength1000")]
        public string Narrative { get; set; }

        [Range(0, 100, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "Points0_100")]
        public int Points { get; set; }

        public int Priority { get; set; }

        //public int SprintId { get; set; }
        //public virtual Sprint Sprint { get; set; }

        public List<Story> Children { get; set; }

        public List<Task> Tasks { get; set; }


        public bool HasChildren()
        {
            if (Children == null || Children.Count() == 0)
                return false;
            else
                return true;
        }

    }
}