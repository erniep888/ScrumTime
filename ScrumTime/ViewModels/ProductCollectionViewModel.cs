using System.Collections.Generic;
using System.Linq;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class ProductCollectionViewModel 
    {
        private const string TitleName = "Product"; // ScrumTime 0.9 - Product

        public string Title { get { return TitleName; } }
        public List<ProductViewModel> ProductViewModels { get; set; }

        public static ProductCollectionViewModel BuildByNameAlphabetical(int currentProductId)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();   
            ProductCollectionViewModel productCollectionViewModel = new ProductCollectionViewModel()
            {
                ProductViewModels = new List<ProductViewModel>()
            };

            var results = from p in scrumTimeEntities.Products
                          orderby p.Name ascending
                          select p;
            foreach (Product product in results)
            {
                ProductViewModel productViewModel = new ProductViewModel()
                {
                    IsCurrent = (product.ProductId == currentProductId) ? true : false,
                    ProductModel = product
                };
                productCollectionViewModel.ProductViewModels.Add(productViewModel);
            }
            
            return productCollectionViewModel;
        }
    }
}