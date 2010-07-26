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
    }
}