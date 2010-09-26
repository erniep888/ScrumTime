using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.Helpers;

namespace ScrumTime.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            SessionHelper.SetCurrentProductId(Session, 1);
            Session["currentSprintId"] = 1;
            return View();
        }

    }
}
