using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;
using ScrumTime.Helpers;

namespace ScrumTime.ViewModels
{
    public class ScrumViewModel
    {        
        public Scrum ScrumModel { get; set; }
        public List<string> MemberUsernames { get; set; }

        public ScrumViewModel()
        {
        }
    }


}