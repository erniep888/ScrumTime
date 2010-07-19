using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ScrumTime.ViewModels
{
    public class StoryViewModel : ProjectViewModel
    {
        public StoryViewModel()
        {
            SelectedMenuName = "Project";
            SelectedSubMenuName = "Scrum";
        }
    }
}