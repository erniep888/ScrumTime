using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class ScrumCollectionViewModel 
    {
        public ScrumCollectionViewModel()
        {
            
        }

        public List<Scrum> Scrums { get; set; }

        public static ScrumCollectionViewModel BuildByDateOfScrumDesc(int sprintId)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            ScrumCollectionViewModel scrumCollectionViewModel = new ScrumCollectionViewModel();
            Sprint sprint = scrumTimeEntities.Sprints.First<Sprint>(s => s.SprintId == sprintId);
            var results = from s in sprint.Scrums
                          orderby s.DateOfScrum descending
                          select s;
            List<Scrum> scrums = results.ToList<Scrum>();
            scrumCollectionViewModel.Scrums = scrums;

            return scrumCollectionViewModel;
        }
    }
}