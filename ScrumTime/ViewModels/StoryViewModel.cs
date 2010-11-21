using System.Collections.Generic;
using ScrumTime.Helpers;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class StoryViewModel
    {
        public Story StoryModel { get; set; }
        public List<int> Points { get; private set; }
        public List<Sprint> AllSprints { get; set; }

        public StoryViewModel()
        {
            Points = StoryPoints.All();
        }
    }
}