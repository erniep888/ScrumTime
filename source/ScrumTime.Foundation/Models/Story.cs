using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using ScrumTime.Foundation.Resources;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace ScrumTime.Foundation.Models
{
    public class Story : IScrumTimeModel
    {
        public ObjectId Id { get; set; }
        public ObjectId ParentStoryId { get; set; }
        public ObjectId ParentFeatureId { get; set; }

        public List<Artifact> Artifacts { get; set; }

        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "NameLength120")]
        public string Name { get; set; }

        [Required(ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "NarrativeRequired")]
        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "NarrativeLength1000")]
        public string Narrative { get; set; }

        public String Points { get; set; }

        public int Priority { get; set; }

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