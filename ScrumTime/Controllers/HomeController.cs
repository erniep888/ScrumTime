using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.Helpers;
using ScrumTime.Models;
using ScrumTime.Services;

namespace ScrumTime.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            if (UserHelper.IsAuthorized(User.Identity, "Home Screen"))
            {
                return View();
            }                
            else                
                return RedirectToAction("Logon", "Account");
        }

    }
}
