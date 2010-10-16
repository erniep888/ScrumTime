using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.ViewModels;
using ScrumTime.Helpers;
using System.Web.Security;
using System.Web.UI;

namespace ScrumTime.Controllers
{
    public class DashboardController : Controller
    {
        //
        // GET: /Dashboard/  
        [Authorize]
        public ActionResult Index()
        {
            return PartialView();
        }

        [Authorize]
        public ActionResult UpdateSprintBurnDown()
        {
            int sprintId = SessionHelper.GetCurrentSprintId(User.Identity.Name, Session);
            JsonSprintBurnDown jsonSprintBurnDown = new JsonSprintBurnDown(sprintId);
            return new SecureJsonResult(jsonSprintBurnDown);
        }

        [Authorize]
        public ActionResult UpdateTaskHoursPerSprint()
        {
            int productId = SessionHelper.GetCurrentProductId(User.Identity.Name, Session);
            JsonTaskHoursPerSprint jsonTaskHoursPerSprint = new JsonTaskHoursPerSprint(productId);
            return new SecureJsonResult(jsonTaskHoursPerSprint);
        }

    }
}
