using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class ScrumCollectionViewModel 
    {
        public List<Scrum> Scrums { get; set; }
        
        public List<string> Usernames { get; set; }            

        public ScrumCollectionViewModel()
        {
            Scrums = new List<Scrum>();
            Scrums = new List<Scrum>();
        }

        public ScrumCollectionViewModel(int sprintId)
        {
            Scrums = new List<Scrum>();
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