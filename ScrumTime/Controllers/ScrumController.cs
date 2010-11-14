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
    public partial class ScrumController : Controller
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
        [Authorize]
        public virtual ActionResult Index()
        {
            ScrumCollectionViewModel scrumCollectionViewModel =
                ScrumCollectionViewModel.BuildByDateOfScrumDesc(SessionHelper.GetCurrentProductId(User.Identity.Name, Session),
                    SessionHelper.GetCurrentSprintId(User.Identity.Name, Session));
            return PartialView(scrumCollectionViewModel);
        }

        //
        // GET: /Scrum/List
        [Authorize]
        public virtual ActionResult List()
        {
            ScrumCollectionViewModel scrumCollectionViewModel =
                ScrumCollectionViewModel.BuildByDateOfScrumDesc(SessionHelper.GetCurrentProductId(User.Identity.Name, Session),
                    SessionHelper.GetCurrentSprintId(User.Identity.Name, Session));
            return PartialView(scrumCollectionViewModel);
        }

       
        //
        // POST: /Scrum/New
        [Authorize]
        [HttpPost]
        public virtual ActionResult New(FormCollection collection)
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
        [Authorize]
        public virtual ActionResult Edit(int id)
        {
            Scrum scrum = _ScrumService.GetScrumById(id);
            if (scrum == null)  // new scrum
            {
                scrum = new Scrum()
                {
                    DateOfScrum = DateTime.Now,
                    SprintId = SessionHelper.GetCurrentSprintId(User.Identity.Name, Session)
                };
                scrum = _ScrumService.GenerateNewScrumDetails(SessionHelper.GetCurrentSprintId(User.Identity.Name, Session), scrum);                
            }

            IMembershipService membershipService = new AccountMembershipService();
            ScrumViewModel scrumViewModel = new ScrumViewModel()
            {
                ScrumModel = scrum,
                MemberUsernames = membershipService.GetAlphabeticalUsernameList()
            };
            scrumViewModel.MemberUsernames.Insert(0, AccountMembershipService.UNASSIGNED);

            return PartialView(scrumViewModel);
        }

        //
        // POST: /Scrum/Save
        [Authorize]
        [HttpPost]
        public virtual ActionResult Save(FormCollection collection)
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
                ProductId = SessionHelper.GetCurrentProductId(User.Identity.Name, Session)                
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
        [Authorize]
        [HttpPost]
        public virtual ActionResult Delete(int id)
        {
            _ScrumService.DeleteScrum(id);

            return new SecureJsonResult("success");  
        }
    }
}
