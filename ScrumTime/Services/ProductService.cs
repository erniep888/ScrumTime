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

        public Product SaveProduct(Product product)
        {
            if (product != null)
            {
                if (product.ProductId == 0)  // this is new
                {
                    _ScrumTimeEntities.AddToProducts(product);
                }
                else  // the product exists
                {
                    _ScrumTimeEntities.AttachTo("Products", product);

                    ScrumTimeEntities freshScrumTimeEntities =
                        new ScrumTimeEntities(_ScrumTimeEntities.Connection.ConnectionString);
                    Product existingProduct = GetProductById(freshScrumTimeEntities, product.ProductId);
                    if (existingProduct == null)
                    {
                        throw new Exception("The product no longer exists.");
                    }
                    _ScrumTimeEntities.ObjectStateManager.ChangeObjectState(product, System.Data.EntityState.Modified);
                }
                _ScrumTimeEntities.SaveChanges();
            }
            return product;
        }

        public void DeleteProduct(int productId)
        {
            Product existingProduct = GetProductById(productId);

            if (existingProduct != null && existingProduct.ProductId > 0)
            {
                _ScrumTimeEntities.DeleteObject(existingProduct);
                _ScrumTimeEntities.SaveChanges();
            }
            else
                throw new Exception("You have attempted to delete a product that does not exist.");
        }

        // TODO: Ultimately remove GetProductIdOfSample() once no sample is needed.
        public int GetProductIdOfSample()
        {
            int productIdOfSample = -1;
            var results = from p in _ScrumTimeEntities.Products
                          where p.Name.StartsWith("Sample -")
                          select p.ProductId;
            if (results.Count() > 0)
                productIdOfSample = (int)results.First();

            return productIdOfSample;
        }

    }
}