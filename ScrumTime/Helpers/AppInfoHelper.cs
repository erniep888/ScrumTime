using System.Web;

namespace ScrumTime.Helpers
{
    public class AppInfoHelper
    {
        public const string AppName = "ScrumTime";
        public const string AppVersion = "0.9";
        public const string CurrentRelease = "Beta 2";
        public const string TagLine = "scrum project management tool";

        public static string ReleaseTitle
        {
            get { return string.Format("Release {0} {1}", AppVersion, CurrentRelease); }
        }
        
        public static string AppPath(HttpRequestBase request)
        {
            return request.ApplicationPath == null ? "" : request.ApplicationPath.TrimEnd('/');
        }

        public static string PageTitle(string viewTitle)
        {
            return string.Format("{0} - {1} {2}", viewTitle, AppName, AppVersion);
        }
    }
}