using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ScrumTime.ViewModels;
using ScrumTime.Services;
using ScrumTime.Models;
using ScrumTime.Helpers;


namespace ScrumTime.Controllers
{
    public class SprintController : Controller
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

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListContainerByStartDateDesc()
        {
            SprintCollectionViewModel sprintCollectionViewModel = SprintCollectionViewModel.BuildByStartDateDesc(1);
            return PartialView("ListContainer", sprintCollectionViewModel);
        }

        // An AJAX driven result that returns just the simple list of sprints
        public ActionResult ListByStartDateDesc(int productId)
        {
            SprintCollectionViewModel sprintCollectionViewModel = SprintCollectionViewModel.BuildByStartDateDesc(productId);
            return PartialView("List", sprintCollectionViewModel);
        }

        // An AJAX driven result that returns just the td's of the read only sprint...replaces any other
        public ActionResult ReadOnly(int id)
        {
            Sprint sprint = _SprintService.GetSprintById(id);
            return PartialView(sprint);
        }

        // An AJAX driven result that returns just the td's of the editable sprint...replaces read only
        public ActionResult Edit(int id)
        {
            Sprint sprint = _SprintService.GetSprintById(id);
            return PartialView(sprint);
        }

        // An AJAX driven result that returns just the td's of the editable "new" sprint...appends to list
        public ActionResult New(int productId)
        {
            // TODO: May want to lookup the product id to ensure that it is valid
            Sprint sprint = new Sprint()
            {
                ProductId = productId,
                Name = "---",
                StartDate = DateTime.Today,
                FinishDate = DateTime.Today.AddDays(30)
            };
            return PartialView("Edit", sprint);
        }

        // Change Selected Sprint
        [HttpPost]
        public ActionResult ChangeSprint(int id)
        {
            SessionHelper.SetCurrentSprintId(Session, id);
            return new SecureJsonResult("success");
        }

        /// <summary>
        /// Returns the name of the current Sprint
        /// </summary>
        /// <returns>Current sprint name in Json form.</returns>
        public ActionResult CurrentSprintName()
        {
            string currentSprintName = "";
            int currentSprintId = SessionHelper.GetCurrentSprintId(Session);
            if (currentSprintId > 0)
            {
                Sprint currentSprint = SprintService.GetSprintById(_ScrumTimeEntities, currentSprintId);
                if (currentSprint != null)
                    currentSprintName = currentSprint.Name;
            }
            return new SecureJsonResult(currentSprintName);
        }

        // POST: /Sprint/Save
        [HttpPost]
        public ActionResult Save(FormCollection collection)
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
                    return RedirectToAction("ListByStartDateDesc", new { productId = Int32.Parse(productId) });
                else
                    return RedirectToAction("ReadOnly", new { id = Int32.Parse(id) });
            }
            catch (Exception ex)
            {
                return View();  // TODO:  Handle displaying the exception condition
            }
        }

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                string productId = collection.Get("productId");
                string idAsString = collection.Get("sprintId");
                _SprintService.DeleteSprint(Int32.Parse(idAsString));
                return RedirectToAction("ListByStartDateDesc", new { productId = Int32.Parse(productId) });
            }
            catch
            {
                return View();
            }
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
