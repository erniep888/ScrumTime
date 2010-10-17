using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;
using ScrumTime.Services;

namespace ScrumTime.ViewModels
{
    public class JsonTaskHoursPerSprint
    {
        public List<object> Data { get; set; }
        public List<string> Ticks { get; set; }
        public decimal YAxisMin { get; set; }
        public decimal YAxisMax { get; set; }

        public JsonTaskHoursPerSprint(int productId, int currentSprintId)
            : base()
        {
            Data = new List<object>();
            Ticks = new List<string>();
            YAxisMin = 0;

            if (productId >= 0)
            {
                ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
                ProductService productService = new ProductService(scrumTimeEntities);
                Product product = productService.GetProductById(productId);

                Data.Add(CreateTaskHoursPerSprintJsonList(product, currentSprintId));
            }
            else            
                HandleBadProductId();
            
            
        }

        private void HandleBadProductId()
        {
            List<object> taskHoursPerSprintJsonList = new List<object>();
            taskHoursPerSprintJsonList.Add(0);
            taskHoursPerSprintJsonList.Add(0);
            taskHoursPerSprintJsonList.Add("None");
            Data.Add(taskHoursPerSprintJsonList);
            Ticks.Add(" ");
            YAxisMax = 10;
        }


        // [[1, 250, 'Unscheduled'], [2, 54, 'Sprint 1'], [3, 20, 'Sprint Banana'], [4, 0, 'Sprint Cross Reference'], [5, 8, 'Sprint Sammy']]
        private List<object> CreateTaskHoursPerSprintJsonList(Product product, int currentSprintId)
        {
            List<object> taskHoursPerSprintJsonList = new List<object>();

            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            TaskService taskService = new TaskService(scrumTimeEntities);
            decimal unassignedTaskHours = taskService.GetUnassignedTaskHours(product.ProductId);
            CheckSetYAxisMax(unassignedTaskHours);
            List<object> unassignedHoursList = new List<object>();            
            unassignedHoursList.Add(1);
            unassignedHoursList.Add(unassignedTaskHours);
            unassignedHoursList.Add("Unassigned");
            taskHoursPerSprintJsonList.Add(unassignedHoursList);
            Ticks.Add(" ");

            SprintService sprintService = new SprintService(scrumTimeEntities);
            List<Sprint> mostRecentSprints = sprintService.GetMostRecentSprints(product.ProductId, currentSprintId, 4);
            int index = 2;
            foreach (Sprint recentSprint in mostRecentSprints)
            {
                List<object> sprintHoursList = new List<object>();
                sprintHoursList.Add(index);
                sprintHoursList.Add(CalculateHoursForSprint(recentSprint));
                sprintHoursList.Add(recentSprint.Name);
                taskHoursPerSprintJsonList.Add(sprintHoursList);
                Ticks.Add(" ");
                index++;
            }

            return taskHoursPerSprintJsonList;
        }

        private decimal CalculateHoursForSprint(Sprint sprint)
        {
            decimal hours = 0;
            if (sprint != null && sprint.Stories != null && sprint.Stories.Count() > 0)
            {
                foreach (Story story in sprint.Stories)
                {
                    if (story.Tasks != null && story.Tasks.Count() > 0)
                        hours += (story.Tasks.Sum(t => t.Hours) != null) ?
                            (decimal)story.Tasks.Sum(t => t.Hours) : 0;
                }
            }
            CheckSetYAxisMax(hours);
            return hours;
        }

        private void CheckSetYAxisMax(decimal maxHours)
        {
            if ((maxHours + 10) > YAxisMax)
                YAxisMax = maxHours + 10;
        }
    }
}