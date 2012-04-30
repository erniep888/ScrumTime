using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Driver.Linq;
using ScrumTime.Foundation.Models;

namespace ScrumTime.Foundation.DataAccessLayer
{
    public class StoryRepository : BaseRepository<Story>
    {
        public StoryRepository()
            : base("Stories")
        {
        }

        public void SetDefaultStoryPoints()
        {
            var points = scrumTimeContext.StoryPoints().AsQueryable<StoryPoint>();
            if (points.SingleOrDefault(m => m.Name == "0") == null)
                scrumTimeContext.StoryPoints().Insert(new StoryPoint() { Name = "0", NumericValue = 0 });
            if (points.SingleOrDefault(m => m.Name == "1") == null)
                scrumTimeContext.StoryPoints().Insert(new StoryPoint() { Name = "1", NumericValue = 1 });
            if (points.SingleOrDefault(m => m.Name == "2") == null)
                scrumTimeContext.StoryPoints().Insert(new StoryPoint() { Name = "2", NumericValue = 2 });
            if (points.SingleOrDefault(m => m.Name == "3") == null)
                scrumTimeContext.StoryPoints().Insert(new StoryPoint() { Name = "3", NumericValue = 3 });
            if (points.SingleOrDefault(m => m.Name == "5") == null)
                scrumTimeContext.StoryPoints().Insert(new StoryPoint() { Name = "5", NumericValue = 5 });
            if (points.SingleOrDefault(m => m.Name == "8") == null)
                scrumTimeContext.StoryPoints().Insert(new StoryPoint() { Name = "8", NumericValue = 8 });
            if (points.SingleOrDefault(m => m.Name == "13") == null)
                scrumTimeContext.StoryPoints().Insert(new StoryPoint() { Name = "13", NumericValue = 13 });
            if (points.SingleOrDefault(m => m.Name == "20") == null)
                scrumTimeContext.StoryPoints().Insert(new StoryPoint() { Name = "20", NumericValue = 20 });
            if (points.SingleOrDefault(m => m.Name == "40") == null)
                scrumTimeContext.StoryPoints().Insert(new StoryPoint() { Name = "40", NumericValue = 40 });
            if (points.SingleOrDefault(m => m.Name == "100") == null)
                scrumTimeContext.StoryPoints().Insert(new StoryPoint() { Name = "100", NumericValue = 100 }); 
        }
    }
}
