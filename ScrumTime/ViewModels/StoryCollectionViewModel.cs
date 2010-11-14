using System.Collections.Generic;
using System.Linq;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class StoryCollectionViewModel 
    {
        private const string TitleName = "Backlog"; // ScrumTime 0.9 - Backlog

        public string Title { get { return TitleName; } }
        public List<Story> Stories { get; set; }

        public static StoryCollectionViewModel BuildByPriorityAsc(int productId)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            StoryCollectionViewModel storyCollectionViewModel = new StoryCollectionViewModel();
            Product product = scrumTimeEntities.Products.First<Product>(p => p.ProductId == productId);
            var results = from s in product.Stories
                          orderby s.Priority ascending
                          select s;
            List<Story> stories = results.ToList<Story>();
            storyCollectionViewModel.Stories = stories;            

            return storyCollectionViewModel;
        }
    }
}