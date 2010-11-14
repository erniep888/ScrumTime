namespace ScrumTime.ViewModels
{
    public class DashboardViewModel
    {
        private const string TitleName = "Dashboard"; // ScrumTime 0.9 - Dashboard

        public string CurrentProductName { get; set; }
        public string CurrentSprintName { get; set; }
        public string NextReleaseName { get; set; }
        public string Title { get { return TitleName; } }
    }
}