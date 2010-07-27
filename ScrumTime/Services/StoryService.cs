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

        public Story GetStoryById(int id)
        {
            Story story = null;
            var results = from s in _ScrumTimeEntities.Stories
                          where s.StoryId == id
                          select s;
            if (results.Count() > 0)
                story = results.First<Story>();
            else
                story = new Story();
            return story;
        }

        public Story SaveStory(Story story)
        {
            if (story != null)
            {
                Story previousStory = null;
                int totalNumberOfStories = _ScrumTimeEntities.Stories.Count();
                if (story.StoryId != null)
                {
                    previousStory = GetStoryById(story.StoryId);
                    if (previousStory != null &&
                        previousStory.Priority == story.Priority)
                    {
                        // No need to update other story priorities
                    }
                    else
                    {
                        // Update other story priorities greater than this story priority

                    }
                }
            }
            return story;
        }

        protected void UpdateStoryPriorities(int currentPriority, int totalNumberOfStories)
        {
            if (currentPriority < 1)
                currentPriority = 1;
            else if (currentPriority > totalNumberOfStories)
                currentPriority = totalNumberOfStories;
            var results = from s in _ScrumTimeEntities.Stories
                          where s.Priority >= currentPriority
                          orderby s.Priority ascending
                          select s;
            foreach (Story story in results)
            {
                story.Priority++;
            }
            _ScrumTimeEntities.SaveChanges();
        }

        protected void DecreasePriorityValuesByOne(int start, int stop)
        {
            var results = from s in _ScrumTimeEntities.Stories
                          where s.Priority > start && s.Priority <= stop
                          orderby s.Priority ascending
                          select s;
            foreach (Story s in results)
            {
                s.Priority--;
            }
            _ScrumTimeEntities.SaveChanges();
        }

        protected void IncreasePriorityValuesByOne(int start, int stop)
        {
            var results = from s in _ScrumTimeEntities.Stories
                          where s.Priority >= start && s.Priority < stop
                          orderby s.Priority ascending
                          select s;
            foreach (Story s in results)
            {
                s.Priority++;
            }
            _ScrumTimeEntities.SaveChanges();
        }

    }
}