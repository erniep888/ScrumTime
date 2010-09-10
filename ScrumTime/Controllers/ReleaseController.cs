using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.ViewModels;

namespace ScrumTime.Controllers
{
    public class ReleaseController : Controller
    {
        //
        // GET: /Release/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListByTargetDateAsc()
        {
            ReleaseCollectionViewModel releaseCollectionViewModel = ReleaseCollectionViewModel.BuildByTargetDateAsc(1);
            return PartialView("List", releaseCollectionViewModel);
        }

    }
}
