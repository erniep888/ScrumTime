using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.ViewModels
{
    public class JsonSchedule
    {
        public List<object> Data { get; set; }
        public List<string> YAxisTicks { get; set; }
        public int XAxisTickIntervalDays { get; set; }
        public List<object> Series { get; set; }

        public JsonSchedule(List<Release> releases, List<Sprint> sprints, 
            DateTime startDateRange, DateTime endDateRange) : base()
        {
            Data = new List<object>();
            YAxisTicks = new List<string>();
            SetXAxisTickIntervalDays(startDateRange, endDateRange);
            Series = new List<object>();

            int sprintIndex = sprints.Count();
            if (sprintIndex > 0)
            {
                foreach (Sprint sprint in sprints)
                {                
                    Data.Add(CreateSprintJsonList(sprintIndex, sprint, startDateRange, endDateRange));                
                    Series.Add(new JsonDataSeriesSprintElement() { lineWidth = 3, showMarker = false, 
                        label = "Sprint " + sprint.Name });
                    sprintIndex--;
                }

                var descendingSprints = from s in sprints
                                    orderby s.StartDate descending
                                    select s;
                // the YAxis ticks need to be listed in reverse order
            
                foreach (Sprint sprint in descendingSprints)
                {
                    YAxisTicks.Add(sprint.Name);
                }
            }            

            foreach (Release release in releases)
            {
                Data.Add(CreateReleaseJsonList(sprints.Count(), release));
                Series.Add(new JsonDataSeriesReleaseElement() { lineWidth = 6, showMarker = false, 
                    label = "Release " + release.Name, color = "#ff4444", showLabel = true });
            }

            JsonDataSeriesPointLabelsElement pointLabels = new JsonDataSeriesPointLabelsElement()
            {
                hideZeros = true, labelsFromSeries = true
            };
            JsonDataSeriesPointElement seriesPoint = new JsonDataSeriesPointElement() 
            { 
                pointLabels = pointLabels 
            };
            Series.Add(seriesPoint);

            if (sprints.Count() == 0)
            {
                YAxisTicks.Add(" ");  // a bit of a hack to allow the schedule to display...forces data to be present
                Data.Add(CreateSprintJsonList(1, startDateRange.AddYears(-50),
                    startDateRange.AddYears(-50), startDateRange, endDateRange));
            }

        }

        private void CreateSeries()
        {
        }

        private void SetXAxisTickIntervalDays(DateTime startDateRange, DateTime endDateRange)
        {

            TimeSpan difference =  endDateRange.Subtract(startDateRange);

            if (difference.Days < 14)
                XAxisTickIntervalDays = 1;
            else if (difference.Days < 49)
                XAxisTickIntervalDays = 7;
            else if (difference.Days < 365)
                XAxisTickIntervalDays = 14;
            else if (difference.Days < 730)
                XAxisTickIntervalDays = 28;
            else if (difference.Days < 1460)
                XAxisTickIntervalDays = 56;
            else
                XAxisTickIntervalDays = 365;
        }


        // [['09/20/2010', 0, 'Release 0.6'], ['09/20/2010', 3, 'Release 0.6']]
        private List<object> CreateReleaseJsonList(int sprintCount, Release release)
        {
            sprintCount = (sprintCount < 1) ? 1 : sprintCount;
            List<object> releaseJsonList = new List<object>();

            List<object> releaseTopDetailsList = new List<object>();
            releaseTopDetailsList.Add(release.Target.ToString("MM/dd/yyyy"));
            releaseTopDetailsList.Add(0);
            releaseTopDetailsList.Add("Release " + release.Name);
            releaseJsonList.Add(releaseTopDetailsList);

            List<object> releaseBottomDetailsList = new List<object>();
            releaseBottomDetailsList.Add(release.Target.ToString("MM/dd/yyyy"));
            releaseBottomDetailsList.Add(sprintCount);
            releaseBottomDetailsList.Add("Release " + release.Name);
            releaseJsonList.Add(releaseBottomDetailsList);

            return releaseJsonList;
        }

        // [['08/03/2010', 1, '08/03/2010'], ['09/15/2010', 1, '09/15/2010']]
        private List<object> CreateSprintJsonList(int sprintIndex, Sprint sprint,
            DateTime startDateRange, DateTime endDateRange)
        {
            List<object> sprintJsonList = new List<object>();
            DateTime startDate = sprint.StartDate;
            List<object> sprintStartDetailsList = new List<object>();
            sprintStartDetailsList.Add(startDate.ToString("MM/dd/yyyy"));
            sprintStartDetailsList.Add(sprintIndex);
            sprintStartDetailsList.Add(startDate.ToString("MM/dd/yyyy"));
            sprintJsonList.Add(sprintStartDetailsList);

            DateTime finishDate = sprint.FinishDate;
            List<object> sprintFinishDetailsList = new List<object>();
            sprintFinishDetailsList.Add(finishDate.ToString("MM/dd/yyyy"));
            sprintFinishDetailsList.Add(sprintIndex);
            sprintFinishDetailsList.Add(finishDate.ToString("MM/dd/yyyy"));
            sprintJsonList.Add(sprintFinishDetailsList);

            return sprintJsonList;
        }

        // [['08/03/2010', 1, '08/03/2010'], ['09/15/2010', 1, '09/15/2010']]
        private List<object> CreateSprintJsonList(int sprintIndex, DateTime sprintStartDate,
            DateTime sprintFinishDate, DateTime startDateRange, DateTime endDateRange)
        {
            List<object> sprintJsonList = new List<object>();
            DateTime startDate = sprintStartDate;
            List<object> sprintStartDetailsList = new List<object>();
            sprintStartDetailsList.Add(startDate.ToString("MM/dd/yyyy"));
            sprintStartDetailsList.Add(sprintIndex);
            sprintStartDetailsList.Add(startDate.ToString("MM/dd/yyyy"));
            sprintJsonList.Add(sprintStartDetailsList);

            DateTime finishDate = sprintFinishDate;
            List<object> sprintFinishDetailsList = new List<object>();
            sprintFinishDetailsList.Add(finishDate.ToString("MM/dd/yyyy"));
            sprintFinishDetailsList.Add(sprintIndex);
            sprintFinishDetailsList.Add(finishDate.ToString("MM/dd/yyyy"));
            sprintJsonList.Add(sprintFinishDetailsList);

            return sprintJsonList;
        }
        
    }

    // { lineWidth: 3, showMarker: false, label: 'Sprint Beta' }
    public class JsonDataSeriesSprintElement
    {
        public int lineWidth { get; set; }
        public Boolean showMarker { get; set; }
        public string label { get; set; }
    }

    // { lineWidth: 6, showMarker: false, label: 'Release 0.6', color: '#ff4444', showLabel: true }
    public class JsonDataSeriesReleaseElement
    {
        public int lineWidth { get; set; }
        public Boolean showMarker { get; set; }
        public string label { get; set; }
        public string color { get; set; }
        public Boolean showLabel { get; set; }
    }

    // { pointLabels: { labelsFromSeries: true, hideZeros: true } }
    public class JsonDataSeriesPointElement
    {
        public JsonDataSeriesPointLabelsElement pointLabels { get; set; }
    }

    // { labelsFromSeries: true, hideZeros: true }
    public class JsonDataSeriesPointLabelsElement
    {
        public Boolean labelsFromSeries { get; set; }
        public Boolean hideZeros { get; set; }
    }
}