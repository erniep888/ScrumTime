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

        // if there are any releases that are targetted within the startDate
        // to endDate range. include them
        public List<Release> GetReleasesWithinDateRange(int productId, DateTime startDate, DateTime endDate)
        {
            var results = from s in _ScrumTimeEntities.Releases
                          where s.Target.CompareTo(startDate) > 0 && s.Target.CompareTo(endDate) < 0
                            && s.ProductId == productId
                          orderby s.Target ascending
                          select s;
            return results.ToList<Release>();
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

        public Release SaveRelease(Release release)
        {
            if (release != null)
            {
                if (release.ReleaseId == 0)  // this is new
                {
                    _ScrumTimeEntities.AddToReleases(release);
                }
                else  // the release exists
                {
                    _ScrumTimeEntities.AttachTo("Releases", release);

                    ScrumTimeEntities freshScrumTimeEntities =
                        new ScrumTimeEntities(_ScrumTimeEntities.Connection.ConnectionString);
                    Release existingRelease = GetReleaseById(freshScrumTimeEntities, release.ReleaseId);
                    if (existingRelease == null)
                    {
                        throw new Exception("The release no longer exists.");
                    }
                    _ScrumTimeEntities.ObjectStateManager.ChangeObjectState(release, System.Data.EntityState.Modified);
                }
                _ScrumTimeEntities.SaveChanges();
            }
            return release;
        }

        public void DeleteRelease(int releaseId)
        {
            Release existingRelease = GetReleaseById(releaseId);

            if (existingRelease != null && existingRelease.ReleaseId > 0)
            {
                _ScrumTimeEntities.DeleteObject(existingRelease);
                _ScrumTimeEntities.SaveChanges();
            }
            else
                throw new Exception("You have attempted to delete a release that does not exist.");
        }
    }
}