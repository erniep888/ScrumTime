using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.ViewModels;
using ScrumTime.Services;
using ScrumTime.Models;

namespace ScrumTime.Controllers
{
    public class ReleaseController : Controller
    {
        ScrumTimeEntities _ScrumTimeEntities;
        ReleaseService _ReleaseService;

        public ReleaseController()
        {
            _ScrumTimeEntities = new ScrumTimeEntities();
            _ReleaseService = new ReleaseService(_ScrumTimeEntities);
        }

        //
        // GET: /Release/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListByTargetDateAsc()
        {
            ReleaseCollectionViewModel releaseCollectionViewModel = ReleaseCollectionViewModel.BuildByTargetDateDesc(1);
            return PartialView("List", releaseCollectionViewModel);
        }

        // An AJAX driven result that returns just the td's of the editable release...replaces read only
        public ActionResult Edit(int id)
        {
            Release release = _ReleaseService.GetReleaseById(id);
            return PartialView(release);
        }

    }
}
