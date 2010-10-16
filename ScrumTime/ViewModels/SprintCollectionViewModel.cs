using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class SprintCollectionViewModel 
    {
        public int ProductId { get; set; }
        public int CurrentSprintId { get; set; }

        public SprintCollectionViewModel()
        {
            
        }

        public List<Sprint> Sprints { get; set; }

        public static SprintCollectionViewModel BuildByStartDateDesc(int productId)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            SprintCollectionViewModel sprintCollectionViewModel = new SprintCollectionViewModel();
            Product product = scrumTimeEntities.Products.First<Product>(p => p.ProductId == productId);
            var results = from s in product.Sprints
                          orderby s.StartDate descending
                          select s;
            List<Sprint> sprints = results.ToList<Sprint>();
            sprintCollectionViewModel.Sprints = sprints;
            sprintCollectionViewModel.ProductId = productId;

            return sprintCollectionViewModel;
        }
    }
}