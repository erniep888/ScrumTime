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
    public partial class ScheduleController : Controller
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
        public virtual ActionResult Index()
        {
            DateTime fromDate = DateTime.Now.AddDays(-60);
            DateTime toDate = DateTime.Now.AddDays(60);
            SprintService sprintService = new SprintService(_ScrumTimeEntities);
            Sprint currentSprint = sprintService.GetSprintById(SessionHelper.GetCurrentSprintId(User.Identity.Name, Session));
            if (currentSprint != null && currentSprint.SprintId > 0)
            {
                fromDate = currentSprint.StartDate.AddDays(-60);
                toDate = currentSprint.FinishDate.AddDays(60);
            }
            ScheduleViewModel scheduleViewModel = new ScheduleViewModel()
            {
                FromDate = fromDate,
                ToDate = toDate
            };
            return View(scheduleViewModel);
        }

        [Authorize]
        public virtual ActionResult ReleaseList()
        {
            return PartialView();
        }

        [Authorize]
        public virtual ActionResult SprintList()
        {
            return PartialView();
        }

        [Authorize]
        public virtual ActionResult UpdateCalendar(string startDateRange, string endDateRange)
        {
            DateTime startDate = DateTime.Parse(startDateRange);
            DateTime endDate = DateTime.Parse(endDateRange);
            List<Sprint> sprints = _SprintService.GetSprintsWithinDateRange(
                SessionHelper.GetCurrentProductId(User.Identity.Name, Session), startDate, endDate);
            List<Release> releases = _ReleaseService.GetReleasesWithinDateRange(
                SessionHelper.GetCurrentProductId(User.Identity.Name, Session), startDate, endDate);
            JsonSchedule jsonSchedule = new JsonSchedule(releases, sprints, startDate, endDate);
            return new SecureJsonResult(jsonSchedule);
        }

    }
}
