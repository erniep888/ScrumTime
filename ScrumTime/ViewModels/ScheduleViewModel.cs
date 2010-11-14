using System;

namespace ScrumTime.ViewModels
{
    public class ScheduleViewModel
    {
        private const string TitleName = "Schedule"; // ScrumTime 0.9 - Schedule

        public string Title { get { return TitleName; } }
        public DateTime FromDate { get; set; }
        public DateTime ToDate { get; set; }
    }
}