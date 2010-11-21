using System;
using System.Linq;
using System.Web.Mvc;
using ScrumTime.Helpers;
using ScrumTime.Models;
using ScrumTime.Services;
using ScrumTime.ViewModels;

namespace ScrumTime.Controllers
{
    public partial class ProductController : Controller
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
        public virtual ActionResult Index()
        {
            int currentProductId = SessionHelper.GetCurrentProductId(User.Identity.Name, Session);
            return PartialView(ProductCollectionViewModel.BuildByNameAlphabetical(currentProductId));
        }

        // An AJAX driven result that returns just the simple list of releases
        [Authorize]
        public virtual ActionResult ListByNameAlphabetical()
        {
            int currentProductId = SessionHelper.GetCurrentProductId(User.Identity.Name, Session);
            return PartialView(Views.List, ProductCollectionViewModel.BuildByNameAlphabetical(currentProductId));
        }

        // An AJAX driven result that returns just the td's of the read only product...replaces any other
        [Authorize]
        public virtual ActionResult ReadOnly(int id)
        {
            Product product = _ProductService.GetProductById(id);           
            return PartialView(CreateProductViewModel(product));
        }

        // An AJAX driven result that returns just the td's of the editable product...replaces read only
        [Authorize]
        public virtual ActionResult Edit(int id)
        {
            Product product = _ProductService.GetProductById(id);
            return PartialView(CreateProductViewModel(product));
        }


        // An AJAX driven result that returns just the td's of the editable "new" release...appends to list
        [Authorize]
        public virtual ActionResult New()
        {            
            Product product = new Product()
            {
               Description = "", Name = "New Product"
            };
            return PartialView(Views.Edit, CreateProductViewModel(product));
        }

        // POST: /Product/Save
        [Authorize]
        [HttpPost]
        public virtual ActionResult Save(FormCollection collection)
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
                    return RedirectToAction(Actions.ListByNameAlphabetical());
                else
                    return RedirectToAction(Actions.ReadOnly(Int32.Parse(productId)));
            }
            catch (Exception ex)
            {
                return View();  // TODO:  Handle displaying the exception condition
            }
        }

        [Authorize]
        [HttpPost]
        public virtual ActionResult Delete(FormCollection collection)
        {
            try
            {
                string productId = collection.Get("id");
                _ProductService.DeleteProduct(Int32.Parse(productId));
                return RedirectToAction(Actions.ListByNameAlphabetical());
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
        public virtual ActionResult CurrentEdit()
        {
            ProductCollectionViewModel productCollectionViewModel =
                ProductCollectionViewModel.BuildByNameAlphabetical(SessionHelper.GetCurrentProductId(
                    User.Identity.Name, Session));
            return PartialView(productCollectionViewModel);
        }

        [Authorize]
        public virtual ActionResult CurrentReadOnly()
        {
            ProductService productService = new ProductService(_ScrumTimeEntities);
            Product product = productService.GetProductById(SessionHelper.GetCurrentProductId(User.Identity.Name, Session));
            return PartialView(product);            
        }

        [Authorize]
        [HttpPost]
        public virtual ActionResult SetCurrent(int productId)
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
