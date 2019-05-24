using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class ProductCollectionViewModel 
    {

        public List<ProductViewModel> ProductViewModels { get; set; }

        public ProductCollectionViewModel()
        {
            
        }

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