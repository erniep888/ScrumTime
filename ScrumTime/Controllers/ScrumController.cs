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
    public class ScrumController : Controller
    {
        ScrumTimeEntities _ScrumTimeEntities;
        ScrumService _ScrumService;

        public ScrumController()
        {
            _ScrumTimeEntities = new ScrumTimeEntities();
            _ScrumService = new ScrumService(_ScrumTimeEntities);            
        }

        //
        // GET: /Scrum/

        public ActionResult Index()
        {
            //var value = Session["productId"];
            //Session.Add("productId", 1);
            int currentSprintId = (Session["currentSprintId"] != null) ? 
                (int)Session["currentSprintId"] : -1;
            ScrumCollectionViewModel scrumCollectionViewModel = 
                ScrumCollectionViewModel.BuildByDateOfScrumDesc(currentSprintId);
            return View(scrumCollectionViewModel);
        }

        //
        // GET: /Scrum/List

        public ActionResult List()
        {
            int currentSprintId = (Session["currentSprintId"] != null) ?
                (int)Session["currentSprintId"] : -1;
            ScrumCollectionViewModel scrumCollectionViewModel =
                ScrumCollectionViewModel.BuildByDateOfScrumDesc(currentSprintId);
            return View(scrumCollectionViewModel);
        }

        //
        // GET: /Scrum/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Scrum/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        
        //
        // GET: /Scrum/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Scrum/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Scrum/Delete/5
 
        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Scrum/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
