using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.ViewModels;
using ScrumTime.Helpers;

namespace ScrumTime.Controllers
{
    public class DashboardController : Controller
    {
        //
        // GET: /Dashboard/

        public ActionResult Index()
        {
            return PartialView();
        }

        public ActionResult UpdateSprintBurnDown()
        {
            int sprintId = SessionHelper.GetCurrentSprintId(User.Identity, Session);
            JsonSprintBurnDown jsonSprintBurnDown = new JsonSprintBurnDown(sprintId);
            return new SecureJsonResult(jsonSprintBurnDown);
        }

        public ActionResult UpdateTaskHoursPerSprint()
        {
            int productId = SessionHelper.GetCurrentProductId(User.Identity, Session);
            JsonTaskHoursPerSprint jsonTaskHoursPerSprint = new JsonTaskHoursPerSprint(productId);
            return new SecureJsonResult(jsonTaskHoursPerSprint);
        }

    }
}
