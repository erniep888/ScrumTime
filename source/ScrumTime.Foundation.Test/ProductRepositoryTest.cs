using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PetaPoco;
using ScrumTime.Foundation.Models;
using ScrumTime.Foundation.Repositories;

namespace ScrumTime.Foundation.Test
{
    [TestClass]
    public class ProductRepositoryTest
    {
        [TestMethod]
        public void CreateTest()
        {
            var database = new Database("ScrumTimeConnection");
            var repository = new ProductRepository(database);
            var acmeProduct = repository.GetLikeName("Acme");
            //var acmeProduct = repository.GetById(2);
            //if (acmeProduct != null)
            //{
            //    repository.Delete(acmeProduct);
            //}

            if (acmeProduct == null)
            {
                //for (int i = 1; i < 4; i++)
                //{

                //}
                acmeProduct = new Product()
                {
                    Name = "Acme", Description = "A test product."
                };
                repository.Insert(acmeProduct);                
            }
        }

        [TestMethod]
        public void GetByIdTest()
        {
            var database = new Database("ScrumTimeConnection");
            var repository = new ProductRepository(database);

            var product = repository.GetById(1);
            Assert.IsNotNull(product);

        }
    }
}
