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
            // TODO: Pull the initial values from UserSettings in the DB
            SessionHelper.SetCurrentProductId(Session, 1);
            SessionHelper.SetCurrentSprintId(Session, 10);
            return View();
        }

    }
}
