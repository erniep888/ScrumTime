using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class TaskCollectionViewModel
    {
        public bool AddTask { get; set; }
        public Story ParentStoryModel { get; set; }
    }
}