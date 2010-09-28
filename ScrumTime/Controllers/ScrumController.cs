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
            Scrum scrum = _ScrumService.GetScrumById(id);
            if (scrum == null)  // new scrum
            {
                scrum = new Scrum()
                {
                    DateOfScrum = DateTime.Now,
                    SprintId = SessionHelper.GetCurrentSprintId(Session)
                };
                scrum = _ScrumService.GenerateNewScrumDetails(SessionHelper.GetCurrentSprintId(Session), scrum);                
            }

            IMembershipService membershipService = new AccountMembershipService();
            ScrumViewModel scrumViewModel = new ScrumViewModel()
            {
                ScrumModel = scrum,
                MemberUsernames = membershipService.GetAlphabeticalUsernameList()
            };
            scrumViewModel.MemberUsernames.Insert(0, AccountMembershipService.UNASSIGNED);

            return View(scrumViewModel);
        }

        //
        // POST: /Scrum/Save

        [HttpPost]
        public ActionResult Save(FormCollection collection)
        {
            string scrumId = collection.Get("scrumId");
            int scrumIdAsInt = Int32.Parse(scrumId);
            string sprintId = collection.Get("sprintId");
            int sprintIdAsInt = Int32.Parse(sprintId);            
            string dateOfScrum = collection.Get("dateOfScrum");
            DateTime dateOfScrumAsDateTime = DateTime.Parse(dateOfScrum);
            string scrumDetailCount = collection.Get("scrumDetailCount");
            int scrumDetailCountAsInt = Int32.Parse(scrumDetailCount);
            Scrum scrum = new Scrum()
            {
                ScrumId = scrumIdAsInt,
                SprintId = sprintIdAsInt,
                DateOfScrum = dateOfScrumAsDateTime,
                ProductId = SessionHelper.GetCurrentProductId(Session)                
            };
            for (int i = 0; i < scrumDetailCountAsInt; i++)
            {
                string storyTaskDescription = collection.Get("scrumDetails[" + i + "][StoryTaskDescription]");
                string assignedTo = collection.Get("scrumDetails[" + i + "][AssignedTo]");
                string hoursRemaining = collection.Get("scrumDetails[" + i + "][HoursRemaining]");
                string hoursCompleted = collection.Get("scrumDetails[" + i + "][HoursCompleted]");
                string taskId = collection.Get("scrumDetails[" + i + "][TaskId]");
                ScrumDetail scrumDetail = new ScrumDetail()
                {
                    ScrumId = scrumIdAsInt,
                    AssignedTo = assignedTo,
                    HoursRemaining = decimal.Parse(hoursRemaining),
                    HoursCompleted = decimal.Parse(hoursCompleted),
                    StoryTaskDescription = storyTaskDescription,
                    TaskId = Int32.Parse(taskId)                    
                };
                scrum.ScrumDetails.Add(scrumDetail);
            }

            scrum = _ScrumService.SaveScrum(scrum);
            return new SecureJsonResult("success");        
        }        

        //
        // POST: /Scrum/Delete/5

        [HttpPost]
        public ActionResult Delete(int id)
        {
            _ScrumService.DeleteScrum(id);

            return new SecureJsonResult("success");  
        }
    }
}
