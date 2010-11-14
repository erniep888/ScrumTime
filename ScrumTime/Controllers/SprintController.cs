using System;
using System.Web.Mvc;
using ScrumTime.Helpers;
using ScrumTime.Models;
using ScrumTime.Services;
using ScrumTime.ViewModels;

namespace ScrumTime.Controllers
{
    public partial class SprintController : Controller
    {
        ScrumTimeEntities _ScrumTimeEntities;
        SprintService _SprintService;
        ProductService _ProductService;

        public SprintController()
        {
            _ScrumTimeEntities = new ScrumTimeEntities();
            _SprintService = new SprintService(_ScrumTimeEntities);
            _ProductService = new ProductService(_ScrumTimeEntities);
        }

        //
        // GET: /Sprint/
        [Authorize]
        public virtual ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public virtual ActionResult ListContainerByStartDateDesc()
        {
            SprintCollectionViewModel sprintCollectionViewModel = SprintCollectionViewModel.BuildByStartDateDesc(
                SessionHelper.GetCurrentProductId(User.Identity.Name, Session));
            return PartialView(Views.ListContainer, sprintCollectionViewModel);
        }

        // An AJAX driven result that returns just the simple list of sprints
        [Authorize]
        public virtual ActionResult ListByStartDateDesc(int productId)
        {
            SprintCollectionViewModel sprintCollectionViewModel = SprintCollectionViewModel.BuildByStartDateDesc(productId);
            return PartialView(Views.List, sprintCollectionViewModel);
        }

        // An AJAX driven result that returns just the td's of the read only sprint...replaces any other
        [Authorize]
        public virtual ActionResult ReadOnly(int id)
        {
            Sprint sprint = _SprintService.GetSprintById(id);
            return PartialView(sprint);
        }

        // An AJAX driven result that returns just the td's of the editable sprint...replaces read only
        [Authorize]
        public virtual ActionResult Edit(int id)
        {
            Sprint sprint = _SprintService.GetSprintById(id);
            return PartialView(sprint);
        }

        // An AJAX driven result that returns just the td's of the editable "new" sprint...appends to list
        [Authorize]
        public virtual ActionResult New(int productId)
        {
            // TODO: May want to lookup the product id to ensure that it is valid
            Sprint sprint = new Sprint()
            {
                ProductId = productId,
                Name = "---",
                StartDate = DateTime.Today,
                FinishDate = DateTime.Today.AddDays(30)
            };
            return PartialView(Views.Edit, sprint);
        }
      

        /// <summary>
        /// Returns the name of the current Sprint
        /// </summary>
        /// <returns>Current sprint name in Json form.</returns>
        [Authorize]
        public virtual ActionResult CurrentSprintName()
        {
            string currentSprintName = "";
            int currentSprintId = SessionHelper.GetCurrentSprintId(User.Identity.Name, Session);
            if (currentSprintId > 0)
            {
                Sprint currentSprint = SprintService.GetSprintById(_ScrumTimeEntities, currentSprintId);
                if (currentSprint != null)
                    currentSprintName = currentSprint.Name;
            }
            return new SecureJsonResult(currentSprintName);
        }

        // POST: /Sprint/Save
        [Authorize]
        [HttpPost]
        public virtual ActionResult Save(FormCollection collection)
        {
            try
            {
                string id = collection.Get("sprintId");
                string productId = collection.Get("productId");                
                bool newSprint = false;
                if (id == null || id == "0")
                {
                    id = "0";
                    newSprint = true;
                }
                string name = collection.Get("name");
                string description = collection.Get("description");
                string start = collection.Get("start");
                string finish = collection.Get("finish");
                // TODO:  Validate the sprint data before saving
                // TODO:  Set the correct product id
                Sprint sprint = new Sprint()
                {
                    SprintId = Int32.Parse(id),
                    ProductId = Int32.Parse(productId),
                    Name = name,
                    Description = description,
                    StartDate = DateTime.Parse(start),
                    FinishDate = DateTime.Parse(finish)
                };
                _SprintService.SaveSprint(sprint);

                if (newSprint)
                    return RedirectToAction(Actions.ListByStartDateDesc(Int32.Parse(productId)));
                else
                    return RedirectToAction(Actions.ReadOnly(Int32.Parse(id)));
            }
            catch (Exception ex)
            {
                return View();  // TODO:  Handle displaying the exception condition
            }
        }

        [Authorize]
        [HttpPost]
        public virtual ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                string productId = collection.Get("productId");
                string idAsString = collection.Get("sprintId");
                _SprintService.DeleteSprint(Int32.Parse(idAsString));
                return RedirectToAction(Actions.ListByStartDateDesc(Int32.Parse(productId)));
            }
            catch
            {
                return View();
            }
        }

        [Authorize]
        [HttpPost]
        public virtual ActionResult Graph(string startDateRange, string endDateRange)
        {
            DateTime startDate = DateTime.Parse(startDateRange);
            DateTime endDate = DateTime.Parse(endDateRange);
            // if there are any sprints that end after or equal to the startDate
            // make sure to include them in the results.  Conversely, if there
            // are any sprints that begin after the endDate, do not include them.
            return Json(new object());
        }

        [Authorize]
        public virtual ActionResult CurrentEdit()
        {
            SprintCollectionViewModel sprintCollectionViewModel =
                SprintCollectionViewModel.BuildByStartDateDesc(
                    SessionHelper.GetCurrentProductId(User.Identity.Name, Session));
            sprintCollectionViewModel.CurrentSprintId = SessionHelper.GetCurrentSprintId(User.Identity.Name, Session);
            return PartialView(sprintCollectionViewModel);
        }

        [Authorize]
        public virtual ActionResult CurrentReadOnly()
        {
            SprintService sprintService = new SprintService(_ScrumTimeEntities);
            Sprint sprint = sprintService.GetSprintById(SessionHelper.GetCurrentSprintId(User.Identity.Name, Session));
            return PartialView(sprint);
        }

        [Authorize]
        [HttpPost]
        public virtual ActionResult SetCurrent(int sprintId)
        {
            SessionHelper.SetCurrentSprintId(User.Identity.Name, Session, sprintId);
            return new SecureJsonResult(new { sprintId });
        }

    }
}
