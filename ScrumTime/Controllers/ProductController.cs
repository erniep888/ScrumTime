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
        [Authorize]
        public ActionResult Index()
        {           
            int currentProductId = SessionHelper.GetCurrentProductId(User.Identity.Name, Session);
            return PartialView(ProductCollectionViewModel.BuildByNameAlphabetical(currentProductId));
        }

        // An AJAX driven result that returns just the simple list of releases
        [Authorize]
        public ActionResult ListByNameAlphabetical()
        {
            int currentProductId = SessionHelper.GetCurrentProductId(User.Identity.Name, Session);
            return PartialView("List", ProductCollectionViewModel.BuildByNameAlphabetical(currentProductId));
        }

        // An AJAX driven result that returns just the td's of the read only product...replaces any other
        [Authorize]
        public ActionResult ReadOnly(int id)
        {
            Product product = _ProductService.GetProductById(id);           
            return PartialView(CreateProductViewModel(product));
        }

        // An AJAX driven result that returns just the td's of the editable product...replaces read only
        [Authorize]
        public ActionResult Edit(int id)
        {
            Product product = _ProductService.GetProductById(id);
            return PartialView(CreateProductViewModel(product));
        }


        // An AJAX driven result that returns just the td's of the editable "new" release...appends to list
        [Authorize]
        public ActionResult New()
        {            
            Product product = new Product()
            {
               Description = "", Name = "New Product"
            };
            return PartialView("Edit", CreateProductViewModel(product));
        }

        // POST: /Product/Save
        [Authorize]
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

        [Authorize]
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
                IsCurrent = (product.ProductId == SessionHelper.GetCurrentProductId(User.Identity.Name, Session)) ? true : false
            };
            return productViewModel;
        }

        [Authorize]        
        public ActionResult CurrentEdit()
        {
            ProductCollectionViewModel productCollectionViewModel =
                ProductCollectionViewModel.BuildByNameAlphabetical(SessionHelper.GetCurrentProductId(
                    User.Identity.Name, Session));
            return PartialView(productCollectionViewModel);
        }

        [Authorize]        
        public ActionResult CurrentReadOnly()
        {
            ProductService productService = new ProductService(_ScrumTimeEntities);
            Product product = productService.GetProductById(SessionHelper.GetCurrentProductId(User.Identity.Name, Session));
            return PartialView(product);            
        }

        [Authorize]
        [HttpPost]
        public ActionResult SetCurrent(int productId)
        {
            SessionHelper.SetCurrentProductId(User.Identity.Name, Session, productId);
            ProductService productService = new ProductService(_ScrumTimeEntities);
            Product product = productService.GetProductById(SessionHelper.GetCurrentProductId(User.Identity.Name, Session));
            if (product.Sprints != null && product.Sprints.Count() > 0)
            {
                Sprint sprint = product.Sprints.First<Sprint>();
                SessionHelper.SetCurrentSprintId(User.Identity.Name, Session, sprint.SprintId);
            }
            else
            {
                SessionHelper.SetCurrentSprintId(User.Identity.Name, Session, -1);
            }
            return new SecureJsonResult(new { productId });
        }
    }
}
