using System.Collections.Generic;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class ScrumViewModel
    {        
        public Scrum ScrumModel { get; set; }
        public List<string> MemberUsernames { get; set; }
        public int Index { get; set; }
    }
}