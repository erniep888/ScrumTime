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
            int currentProductId = SessionHelper.GetCurrentProductId(Session);
            return PartialView(ProductCollectionViewModel.BuildByNameAlphabetical(currentProductId));
        }

    }
}
