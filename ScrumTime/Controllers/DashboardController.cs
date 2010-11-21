using System.Web.Mvc;
using ScrumTime.Helpers;
using ScrumTime.Models;
using ScrumTime.Services;
using ScrumTime.ViewModels;

namespace ScrumTime.Controllers
{
    public partial class DashboardController : Controller
    {
        //
        // GET: /Dashboard/  
        [Authorize]
        public virtual ActionResult Index()
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            string currentProductName = "None";
            string currentSprintName = "None";
            string nextReleaseName = "None";
            ProductService productService = new ProductService(scrumTimeEntities);
            Product product = productService.GetProductById(SessionHelper.GetCurrentProductId(User.Identity.Name, Session));
            if (product != null && product.ProductId > 0)
            {
                currentProductName = product.Name;
                SprintService sprintService = new SprintService(scrumTimeEntities);
                Sprint sprint = sprintService.GetSprintById(SessionHelper.GetCurrentSprintId(User.Identity.Name, Session));
                if (sprint != null && sprint.SprintId > 0)
                {
                    currentSprintName = sprint.Name;
                    ReleaseService releaseService = new ReleaseService(scrumTimeEntities);
                    Release nextRelease = releaseService.GetNextReleaseEqOrAfterDate(sprint.ProductId, sprint.FinishDate);
                    if (nextRelease != null && nextRelease.ReleaseId > 0)
                        nextReleaseName = nextRelease.Name;
                }
            }
            DashboardViewModel dashboardViewModel = new DashboardViewModel()
            {
                CurrentProductName = currentProductName,
                CurrentSprintName = currentSprintName,
                NextReleaseName = nextReleaseName
            };
            return PartialView(dashboardViewModel);
        }

        [Authorize]
        public virtual ActionResult UpdateSprintBurnDown()
        {
            int sprintId = SessionHelper.GetCurrentSprintId(User.Identity.Name, Session);
            JsonSprintBurnDown jsonSprintBurnDown = new JsonSprintBurnDown(sprintId);
            return new SecureJsonResult(jsonSprintBurnDown);
        }

        [Authorize]
        public virtual ActionResult UpdateTaskHoursPerSprint()
        {
            int productId = SessionHelper.GetCurrentProductId(User.Identity.Name, Session);
            int currentSprintId = SessionHelper.GetCurrentSprintId(User.Identity.Name, Session);
            JsonTaskHoursPerSprint jsonTaskHoursPerSprint = new JsonTaskHoursPerSprint(productId, currentSprintId);
            return new SecureJsonResult(jsonTaskHoursPerSprint);
        }

    }
}
