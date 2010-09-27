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
            ScrumCollectionViewModel scrumCollectionViewModel =
                ScrumCollectionViewModel.BuildByDateOfScrumDesc(SessionHelper.GetCurrentProductId(Session),
                    SessionHelper.GetCurrentSprintId(Session));
            return View(scrumCollectionViewModel);
        }

        //
        // GET: /Scrum/List

        public ActionResult List()
        {
            ScrumCollectionViewModel scrumCollectionViewModel =
                ScrumCollectionViewModel.BuildByDateOfScrumDesc(SessionHelper.GetCurrentProductId(Session),
                    SessionHelper.GetCurrentSprintId(Session));
            return View(scrumCollectionViewModel);
        }

       
        //
        // POST: /Scrum/New

        [HttpPost]
        public ActionResult New(FormCollection collection)
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
            Scrum scrum = new Scrum()
            {
                 DateOfScrum = DateTime.Now,
                 ScrumId = -1
            };
            return View(scrum);
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
