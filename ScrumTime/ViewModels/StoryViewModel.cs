using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;
using ScrumTime.Helpers;

namespace ScrumTime.ViewModels
{
    public class StoryViewModel
    {
        public Story StoryModel { get; set; }
        public List<int> Points { get; private set; }

        public StoryViewModel()
        {
            Points = StoryPoints.All();
        }
    }


}