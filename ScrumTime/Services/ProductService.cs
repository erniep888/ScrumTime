using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.Services
{
    public class ProductService
    {
        ScrumTimeEntities _ScrumTimeEntities;

        public ProductService(ScrumTimeEntities scrumTimeEntities)
        {
            _ScrumTimeEntities = scrumTimeEntities;
        }

        public static Product GetProductById(ScrumTimeEntities scrumTimeEntities, int id)
        {
            Product product = null;
            var results = from t in scrumTimeEntities.Products
                          where t.ProductId == id
                          select t;
            if (results.Count() > 0)
                product = results.First<Product>();
            else
                product = new Product();
            return product;
        }

        public Product GetProductById(int id)
        {
            return GetProductById(_ScrumTimeEntities, id);
        }


    }
}