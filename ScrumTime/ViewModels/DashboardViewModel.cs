using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ScrumTime.ViewModels
{
    public class DashboardViewModel
    {
        public string CurrentProductName { get; set; }
        public string CurrentSprintName { get; set; }
        public string NextReleaseName { get; set; }
    }
}