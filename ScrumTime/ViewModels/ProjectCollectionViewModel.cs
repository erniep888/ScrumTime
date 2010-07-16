using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ScrumTime.ViewModels
{
    public class ProjectCollectionViewModel: MenuViewModel
    {
        public List<ProjectViewModel> ProjectViewModelCollection { get; set; }

        public ProjectCollectionViewModel()
        {
            SelectedMenuName = "Project";
        }

        

    }
}