using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.ViewModels;
using ScrumTime.Services;
using ScrumTime.Models;
using ScrumTime.Helpers;


namespace ScrumTime.Controllers
{
    public class ProductController : Controller
    {
        ScrumTimeEntities _ScrumTimeEntities;
        ProductService _ProductService;

        public ProductController()
        {
            _ScrumTimeEntities = new ScrumTimeEntities();
            _ProductService = new ProductService(_ScrumTimeEntities);            
        }

        //
        // GET: /Product/
        public ActionResult Index()
        {
            int currentProductId = SessionHelper.GetCurrentProductId(User.Identity, Session);
            return PartialView(ProductCollectionViewModel.BuildByNameAlphabetical(currentProductId));
        }

        // An AJAX driven result that returns just the simple list of releases
        public ActionResult ListByNameAlphabetical()
        {
            int currentProductId = SessionHelper.GetCurrentProductId(User.Identity, Session);
            return PartialView("List", ProductCollectionViewModel.BuildByNameAlphabetical(currentProductId));
        }

        // An AJAX driven result that returns just the td's of the read only product...replaces any other
        public ActionResult ReadOnly(int id)
        {
            Product product = _ProductService.GetProductById(id);           
            return PartialView(CreateProductViewModel(product));
        }

        // An AJAX driven result that returns just the td's of the editable product...replaces read only
        public ActionResult Edit(int id)
        {
            Product product = _ProductService.GetProductById(id);
            return PartialView(CreateProductViewModel(product));
        }


        // An AJAX driven result that returns just the td's of the editable "new" release...appends to list
        public ActionResult New()
        {            
            Product product = new Product()
            {
               Description = "", Name = "New Product"
            };
            return PartialView("Edit", CreateProductViewModel(product));
        }

        // POST: /Product/Save
        [HttpPost]
        public ActionResult Save(FormCollection collection)
        {
            try
            {                
                string productId = collection.Get("id");
                bool newProduct = false;
                if (productId == null || productId == "0")
                {
                    productId = "0";
                    newProduct = true;
                }
                string name = collection.Get("name");
                string description = collection.Get("description");
                Product product = new Product()
                {
                    ProductId = Int32.Parse(productId),
                    Name = name,
                    Description = description
                };
                _ProductService.SaveProduct(product);

                if (newProduct)
                    return RedirectToAction("ListByNameAlphabetical");
                else
                    return RedirectToAction("ReadOnly", new { id = Int32.Parse(productId) });
            }
            catch (Exception ex)
            {
                return View();  // TODO:  Handle displaying the exception condition
            }
        }

        [HttpPost]
        public ActionResult Delete(FormCollection collection)
        {
            try
            {
                string productId = collection.Get("id");
                _ProductService.DeleteProduct(Int32.Parse(productId));
                return RedirectToAction("ListByNameAlphabetical");
            }
            catch
            {
                return View();
            }
        }

        protected ProductViewModel CreateProductViewModel(Product product)
        {
            ProductViewModel productViewModel = new ProductViewModel()
            {
                ProductModel = product,
                IsCurrent = (product.ProductId == SessionHelper.GetCurrentProductId(User.Identity, Session)) ? true : false
            };
            return productViewModel;
        }
    }
}
