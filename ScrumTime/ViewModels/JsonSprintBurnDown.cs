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
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            SprintService sprintService = new SprintService(scrumTimeEntities);
            Sprint sprint = sprintService.GetSprintById(sprintId);

            Data = new List<object>();
            Data.Add(CreateIdealScrumTaskJsonList(sprint));
            Data.Add(CreateScrumTaskJsonList(sprint));

            XAxisMinDate = sprint.StartDate.ToString("MM/dd/yyyy");
            XAxisMaxDate = sprint.FinishDate.ToString("MM/dd/yyyy");
            YAxisMin = 0;

            ScrumService scrumService = new ScrumService(scrumTimeEntities);
            YAxisMax = scrumService.GetMaxTaskHourCountBySprintId(sprint.SprintId);
        }


        // [['08/03/2010', 51, '08/03/2010'], ['08/05/2010', 0, '08/05/2010']]
        private List<object> CreateIdealScrumTaskJsonList(Sprint sprint)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            SprintService sprintService = new SprintService(scrumTimeEntities);

            List<object> idealScrumTaskJsonList = new List<object>();
            List<object> scrumDetailList1 = new List<object>();
            scrumDetailList1.Add(sprint.StartDate.ToString("MM/dd/yyyy"));
            scrumDetailList1.Add(sprintService.GetTotalHourCount(sprint.SprintId));
            scrumDetailList1.Add(sprint.StartDate.ToString("MM/dd/yyyy"));
            idealScrumTaskJsonList.Add(scrumDetailList1);
            List<object> scrumDetailList2 = new List<object>();
            scrumDetailList2.Add(sprint.FinishDate.ToString("MM/dd/yyyy"));
            scrumDetailList2.Add(0);
            scrumDetailList2.Add(sprint.FinishDate.ToString("MM/dd/yyyy"));
            idealScrumTaskJsonList.Add(scrumDetailList2);

            return idealScrumTaskJsonList;
        }

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