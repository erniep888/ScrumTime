using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class ReleaseCollectionViewModel 
    {
        public ReleaseCollectionViewModel()
        {
            
        }

        public List<Release> Releases { get; set; }

        public static ReleaseCollectionViewModel BuildByTargetDateAsc(int projectId)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            ReleaseCollectionViewModel releaseCollectionViewModel = new ReleaseCollectionViewModel();
            Project project = scrumTimeEntities.Projects.First<Project>(p => p.ProjectId == 1);
            var results = from s in project.Releases
                          orderby s.Target ascending
                          select s;
            List<Release> releases = results.ToList<Release>();
            releaseCollectionViewModel.Releases = releases;

            return releaseCollectionViewModel;
        }
    }
}