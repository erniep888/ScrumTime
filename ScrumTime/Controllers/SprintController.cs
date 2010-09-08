using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ScrumTime.Controllers
{
    public class SprintController : Controller
    {
        //
        // GET: /Sprint/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult List()
        {
            return PartialView();
        }

        [HttpPost]
        public ActionResult Graph(string startDateRange, string endDateRange)
        {
            DateTime startDate = DateTime.Parse(startDateRange);
            DateTime endDate = DateTime.Parse(endDateRange);
            // if there are any sprints that end after or equal to the startDate
            // make sure to include them in the results.  Conversely, if there
            // are any sprints that begin after the endDate, do not include them.
            return Json(new object());
        }

    }
}
