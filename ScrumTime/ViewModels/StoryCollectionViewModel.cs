using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class StoryCollectionViewModel : ProjectViewModel
    {
        public StoryCollectionViewModel()
        {
            SelectedMenuName = "Project";
            SelectedSubMenuName = "Scrum";
        }

        public List<Story> Stories { get; set; }
    }
}