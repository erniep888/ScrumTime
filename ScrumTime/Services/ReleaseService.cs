using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.Services
{
    public class ReleaseService
    {
        ScrumTimeEntities _ScrumTimeEntities;

        public ReleaseService(ScrumTimeEntities scrumTimeEntities)
        {
            _ScrumTimeEntities = scrumTimeEntities;
        }


    }
}