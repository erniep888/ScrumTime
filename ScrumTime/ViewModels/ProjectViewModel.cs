using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ScrumTime.ViewModels
{
    public class ProjectViewModel: MenuViewModel
    {
        public ProjectViewModel()
        {
            SelectedMenuName = "Project";
        }
        public Guid ProjectId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string CreatedBy { get; set; }
        public DateTime DateCreated { get; set; }
        public string SelectedSubMenuName { get; set; }      

    }
}