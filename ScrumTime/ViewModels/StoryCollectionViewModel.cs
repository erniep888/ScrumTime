using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class StoryCollectionViewModel 
    {
        public StoryCollectionViewModel()
        {
            
        }

        public List<Story> Stories { get; set; }

        public static StoryCollectionViewModel BuildByPriorityAsc(int projectId)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            StoryCollectionViewModel storyCollectionViewModel = new StoryCollectionViewModel();
            Project project = scrumTimeEntities.Projects.First<Project>(p => p.ProjectId == 1);
            var results = from s in project.Stories
                          orderby s.Priority ascending
                          select s;
            List<Story> stories = results.ToList<Story>();
            storyCollectionViewModel.Stories = stories;            

            return storyCollectionViewModel;
        }
    }
}