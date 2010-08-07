using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.Services
{
    public class StoryService
    {
        ScrumTimeEntities _ScrumTimeEntities;

        public StoryService(ScrumTimeEntities scrumTimeEntities)
        {
            _ScrumTimeEntities = scrumTimeEntities;
        }


        public Story GetStoryById(ScrumTimeEntities scrumTimeEntities, int id)
        {            
            Story story = null;
            var results = from s in scrumTimeEntities.Stories
                          where s.StoryId == id
                          select s;
            if (results.Count() > 0)
                story = results.First<Story>();
            else
                story = new Story();
            return story;
        }

        public Story GetStoryById(int id)
        {
            return GetStoryById(_ScrumTimeEntities, id);
        }

        public Story SaveStory(Story story)
        {
            if (story != null)
            {
                if (story.StoryId == 0)  // this is new
                {
                    SetPriorityForSave(story, 0, story.Priority);
                    _ScrumTimeEntities.AddToStories(story);
                }
                else  // the story exists
                {
                    _ScrumTimeEntities.AttachTo("Stories", story);
                    
                    ScrumTimeEntities freshScrumTimeEntities =
                        new ScrumTimeEntities(_ScrumTimeEntities.Connection.ConnectionString);
                    Story existingStory = GetStoryById(freshScrumTimeEntities, story.StoryId);
                    if (existingStory != null && existingStory.StoryId > 0)
                    {
                        SetPriorityForSave(story, existingStory.Priority, story.Priority);
                    }
                    else
                    {
                        throw new Exception("The story no longer exists.");
                    }
                    _ScrumTimeEntities.ObjectStateManager.ChangeObjectState(story, System.Data.EntityState.Modified);
                }
                _ScrumTimeEntities.SaveChanges();
            }
            return story;
        }

        public void DeleteStory(int storyId)
        {
            Story existingStory = GetStoryById(storyId);

            if (existingStory != null && existingStory.StoryId > 0)
            {
                int totalStories = _ScrumTimeEntities.Stories.Count();
                _ScrumTimeEntities.DeleteObject(existingStory);
                DecreasePriorityValuesInclusive(existingStory.Priority+1, totalStories);
                _ScrumTimeEntities.SaveChanges();
            }
            else
                throw new Exception("You have attempted to delete a story that does not exist.");
        }


        // Set both priorities to zero or less for a delete scenario
        protected void SetPriorityForSave(Story story, int currentPriority, int targetPriority)
        {
            int totalStories = _ScrumTimeEntities.Stories.Count();
             
            if (currentPriority < 1) // this is a new story
            {
                targetPriority = AdjustToWithinBounds(targetPriority, totalStories + 1);
                story.Priority = targetPriority;
                IncreasePriorityValuesInclusive(targetPriority, totalStories);
            }
            else  // this is an existing story
            {
                targetPriority = AdjustToWithinBounds(targetPriority, totalStories);
                story.Priority = targetPriority;
                if (currentPriority < targetPriority)
                {
                    DecreasePriorityValuesInclusive(currentPriority + 1, targetPriority);
                }
                else if (currentPriority > targetPriority)
                {
                    IncreasePriorityValuesInclusive(targetPriority, currentPriority - 1);
                }
            }                                  
        }

        protected void DecreasePriorityValuesInclusive(int start, int stop)
        {
            var results = from s in _ScrumTimeEntities.Stories
                          where s.Priority >= start && s.Priority <= stop
                          orderby s.Priority
                          select s;
            foreach (Story story in results)
            {
                story.Priority--;
            }
        }

        protected void IncreasePriorityValuesInclusive(int start, int stop)
        {
            var results = from s in _ScrumTimeEntities.Stories
                          where s.Priority >= start && s.Priority <= stop
                          orderby s.Priority
                          select s;
            foreach (Story story in results)
            {
                story.Priority++;
            }
        }


        protected int AdjustToWithinBounds(int targetPriority, int totalStories)
        {
            if (targetPriority > totalStories)
                targetPriority = totalStories;
            else if (targetPriority < 1)
                targetPriority = 1;
            return targetPriority;
        }


    }
}