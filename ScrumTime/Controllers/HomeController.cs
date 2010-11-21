using System.Web.Mvc;
using ScrumTime.Helpers;

namespace ScrumTime.Controllers
{
    public partial class HomeController : Controller
    {
        //
        // GET: /Home/

        public virtual ActionResult Index()
        {
            if (UserHelper.IsAuthorized(User.Identity, "Home Screen"))
            {
                return View();
            }
            return RedirectToAction(MVC.Account.LogOn());
        }
    }
}