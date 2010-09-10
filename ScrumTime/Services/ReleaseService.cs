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

        public static Release GetReleaseById(ScrumTimeEntities scrumTimeEntities, int id)
        {
            Release release = null;
            var results = from t in scrumTimeEntities.Releases
                          where t.ReleaseId == id
                          select t;
            if (results.Count() > 0)
                release = results.First<Release>();
            else
                release = new Release();
            return release;
        }

        public Release GetReleaseById(int id)
        {
            return GetReleaseById(_ScrumTimeEntities, id);
        }


    }
}