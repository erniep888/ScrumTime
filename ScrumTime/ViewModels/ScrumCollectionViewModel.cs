using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using ScrumTime.Models;
using ScrumTime.Services;

namespace ScrumTime.ViewModels
{
    public class ScrumCollectionViewModel 
    {                
        public List<Sprint> Sprints { get; set; }
        public int SprintId { get; set; }
        public string SprintName { get; set; }
        
        public List<Scrum> Scrums { get; set; }
        
        public List<string> Usernames { get; set; }            


        public ScrumCollectionViewModel()
        {
            Scrums = new List<Scrum>();
        }

        public ScrumCollectionViewModel(int sprintId)
        {
            Scrums = new List<Scrum>();
            SprintId = sprintId;
        }
        

        public static ScrumCollectionViewModel BuildByDateOfScrumDesc(int productId, int selectedSprintId)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            ScrumCollectionViewModel scrumCollectionViewModel = new ScrumCollectionViewModel(selectedSprintId);
            if (selectedSprintId > 0)
            {
                Sprint sprint = scrumTimeEntities.Sprints.First<Sprint>(s => s.SprintId == selectedSprintId);
                var results = from s in sprint.Scrums
                              orderby s.DateOfScrum ascending
                              select s;
                List<Scrum> scrums = results.ToList<Scrum>();
                scrumCollectionViewModel.Scrums = scrums;
                scrumCollectionViewModel.Sprints = SprintService.GetAllSprints(scrumTimeEntities, productId);
                scrumCollectionViewModel.SprintName = sprint.Name;
            }
            scrumCollectionViewModel.Usernames = new List<string>();
            AccountMembershipService membershipService = new AccountMembershipService();
            MembershipUserCollection membershipUserCollection = membershipService.GetAllUsers();
            foreach (MembershipUser user in membershipUserCollection)
            {
                scrumCollectionViewModel.Usernames.Add(user.UserName);
            }

            return scrumCollectionViewModel;
        }
    }
}