using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.Helpers;
using ScrumTime.ViewModels;
using ScrumTime.Services;
using ScrumTime.Models;

namespace ScrumTime.Controllers
{
    public class ScheduleController : Controller
    {
        ScrumTimeEntities _ScrumTimeEntities;
        SprintService _SprintService;
        ReleaseService _ReleaseService;

        public ScheduleController()
        {
            _ScrumTimeEntities = new ScrumTimeEntities();
            _SprintService = new SprintService(_ScrumTimeEntities);
            _ReleaseService = new ReleaseService(_ScrumTimeEntities);
        }

        //
        // GET: /Schedule/
        [Authorize]
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult ReleaseList()
        {
            return PartialView();
        }

        [Authorize]
        public ActionResult SprintList()
        {
            return PartialView();
        }

        [Authorize]
        public ActionResult UpdateCalendar(string startDateRange, string endDateRange)
        {
            DateTime startDate = DateTime.Parse(startDateRange);
            DateTime endDate = DateTime.Parse(endDateRange);
            List<Sprint> sprints = _SprintService.GetSprintsWithinDateRange(startDate, endDate);
            List<Release> releases = _ReleaseService.GetReleasesWithinDateRange(startDate, endDate);
            JsonSchedule jsonSchedule = new JsonSchedule(releases, sprints, startDate, endDate);
            return new SecureJsonResult(jsonSchedule);
        }

    }
}
