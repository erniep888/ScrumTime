using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;
using ScrumTime.Services;

namespace ScrumTime.ViewModels
{
    public class JsonSprintBurnDown
    {
        public List<object> Data { get; set; }
        public string XAxisMinDate { get; set; }
        public string XAxisMaxDate { get; set; }
        public decimal YAxisMin { get; set; }
        public decimal YAxisMax { get; set; }

        public JsonSprintBurnDown(int sprintId)
            : base()
        {
            Data = new List<object>();
            YAxisMin = 0;

            if (sprintId >= 0)
            {
                ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
                SprintService sprintService = new SprintService(scrumTimeEntities);
                Sprint sprint = sprintService.GetSprintById(sprintId);
                if (sprint != null && sprint.Scrums.Count() > 0)
                {
                    Data.Add(CreateIdealScrumTaskJsonList(sprint));
                    Data.Add(CreateScrumTaskJsonList(sprint));

                    XAxisMinDate = sprint.StartDate.ToString("MM/dd/yyyy");
                    XAxisMaxDate = sprint.FinishDate.ToString("MM/dd/yyyy");
                    YAxisMin = 0;

                    ScrumService scrumService = new ScrumService(scrumTimeEntities);
                    YAxisMax = scrumService.GetMaxTaskHourCountBySprintId(sprint.SprintId);
                }
                else
                    HandleBadSprint();
            }
            else
                HandleBadSprint();
        }

        private void HandleBadSprint()
        {
            List<object> idealScrumTaskJsonList = new List<object>();
            List<object> scrumDetailList1 = new List<object>();
            List<object> scrumDetailList2 = new List<object>();
            scrumDetailList1.Add("01/01/1990");
            scrumDetailList1.Add(10);
            scrumDetailList1.Add("01/01/1990");
            idealScrumTaskJsonList.Add(scrumDetailList1);

            scrumDetailList2.Add("01/02/1990");
            scrumDetailList2.Add(0);
            scrumDetailList2.Add("01/02/1990");
            idealScrumTaskJsonList.Add(scrumDetailList2);
            Data.Add(idealScrumTaskJsonList);
            XAxisMinDate = DateTime.Now.AddDays(-5).ToString("MM/dd/yyyy");
            XAxisMaxDate = DateTime.Now.AddDays(5).ToString("MM/dd/yyyy");
            YAxisMax = 20;
            YAxisMin = 10;
        }


        // [['08/03/2010', 51, '08/03/2010'], ['08/05/2010', 0, '08/05/2010']]
        private List<object> CreateIdealScrumTaskJsonList(Sprint sprint)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            SprintService sprintService = new SprintService(scrumTimeEntities);

            List<object> idealScrumTaskJsonList = new List<object>();
            List<object> scrumDetailList1 = new List<object>();
            List<object> scrumDetailList2 = new List<object>();
            if (sprint != null)
            {
                scrumDetailList1.Add(sprint.StartDate.ToString("MM/dd/yyyy"));
                scrumDetailList1.Add(sprintService.GetTotalHourCount(sprint.SprintId));
                scrumDetailList1.Add(sprint.StartDate.ToString("MM/dd/yyyy"));
                idealScrumTaskJsonList.Add(scrumDetailList1);

                scrumDetailList2.Add(sprint.FinishDate.ToString("MM/dd/yyyy"));
                scrumDetailList2.Add(0);
                scrumDetailList2.Add(sprint.FinishDate.ToString("MM/dd/yyyy"));
                idealScrumTaskJsonList.Add(scrumDetailList2);
            }
            return idealScrumTaskJsonList;
        }

        //private List<object> HandleEmptyScrumList(s

        // [['08/03/2010', 51, '08/03/2010'], ['08/05/2010', 49, '08/05/2010']]
        private List<object> CreateScrumTaskJsonList(Sprint sprint)
        {
            ScrumService scrumService = new ScrumService(new ScrumTimeEntities());
            List<Scrum> scrums = scrumService.GetScrumsBySprintId(sprint.SprintId);
            List<object> scrumJsonList = new List<object>();
            foreach (Scrum scrum in scrums)
            {
                List<object> scrumDetailList = new List<object>();
                scrumDetailList.Add(scrum.DateOfScrum.ToString("MM/dd/yyyy"));
                scrumDetailList.Add(scrum.ScrumDetails.Sum(s => s.HoursRemaining));
                scrumDetailList.Add(scrum.DateOfScrum.ToString("MM/dd/yyyy"));
                scrumJsonList.Add(scrumDetailList);
            }
            return scrumJsonList;
        }

    }
}