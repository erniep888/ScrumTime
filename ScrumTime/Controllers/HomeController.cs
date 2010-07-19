using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.ViewModels;

namespace ScrumTime.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {           
            return View(new HomeViewModel());
        }

        public ActionResult About()
        {
            return View(new AboutViewModel());
        }
    }
}
