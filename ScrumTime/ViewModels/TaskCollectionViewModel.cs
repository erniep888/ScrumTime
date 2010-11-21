using System.Collections.Generic;
using System.Linq;
using ScrumTime.Models;
using ScrumTime.Services;

namespace ScrumTime.ViewModels
{
    public class TaskCollectionViewModel
    {
        public Story ParentStoryModel { get; set; }
        public List<Task> SortedTaskModels { get; set; }

        public static TaskCollectionViewModel BuildByIdAsc(int storyId)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            StoryService storyService = new StoryService(scrumTimeEntities);
            Story parentStory = storyService.GetStoryById(storyId);

            var results = from t in parentStory.Tasks
                          orderby t.TaskId ascending
                          select t;    
            TaskCollectionViewModel taskCollectionViewModel = new TaskCollectionViewModel()
            {
                ParentStoryModel = parentStory,
                SortedTaskModels = results.ToList<Task>()
            };

            return taskCollectionViewModel;
        }
    }
}