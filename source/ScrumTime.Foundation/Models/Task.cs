﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.ComponentModel.DataAnnotations;
using ScrumTime.Foundation.Resources;
using MongoDB.Bson;

namespace ScrumTime.Foundation.Models
{
    public class Task
    {
        public ObjectId Id { get; set; }

        public List<Artifact> Artifacts { get; set; }

        [Required(ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessageResourceName = "DescriptionRequired")]
        [MaxLength(1000, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "DescriptionLength1000")]
        public string Description { get; set; }

        [Range(0.0d, 40.0d, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "HoursRange0_40")]
        public decimal Hours { get; set; }

        [MaxLength(120, ErrorMessageResourceType = typeof(CommonResources),
            ErrorMessage = "AssignedToMaxLength120")]
        public string AssignedTo { get; set; }
    }
}