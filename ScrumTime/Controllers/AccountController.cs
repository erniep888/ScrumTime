using System;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Security;
using ScrumTime.Helpers;
using ScrumTime.Models;

namespace ScrumTime.Controllers
{
    [HandleError]
    public partial class AccountController : Controller
    {
        public IFormsAuthenticationService FormsService { get; set; }
        public IMembershipService MembershipService { get; set; }

        protected override void Initialize(RequestContext requestContext)
        {
            if (FormsService == null) { FormsService = new FormsAuthenticationService(); }
            if (MembershipService == null) { MembershipService = new AccountMembershipService(); }

            base.Initialize(requestContext);
        }

        // **************************************
        // URL: /Account/LogOn
        // **************************************

        public virtual ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public virtual ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ValidateUser(model.UserName, model.Password))
                {
                    FormsService.SignIn(model.UserName, model.RememberMe);
                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    return RedirectToAction(MVC.Home.Index());
                }
                ModelState.AddModelError("", "The user name or password provided is incorrect.");
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        public virtual ActionResult List()
        {
            MembershipUserCollection users = MembershipService.GetAllUsers();
            return PartialView();
        }

        [HttpPost]
        public virtual ActionResult Delete(string username)
        {
            try
            {
                MembershipService.DeleteUser(username);
                return RedirectToAction(Actions.List());
            }
            catch
            {
                return View();
            }
        }

        // **************************************
        // URL: /Account/LogOff
        // **************************************

        public virtual ActionResult LogOff()
        {
            FormsService.SignOut();

            return RedirectToAction(MVC.Home.Index());
        }

        // **************************************
        // URL: /Account/Register
        // **************************************

        public virtual ActionResult Register()
        {
            ViewModel.PasswordLength = MembershipService.MinPasswordLength;
            return View();
        }

        [HttpPost]
        public virtual ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                // Attempt to register the user
                MembershipCreateStatus createStatus = MembershipService.CreateUser(model.UserName, model.Password, model.Email);

                if (createStatus == MembershipCreateStatus.Success)
                {
                    FormsService.SignIn(model.UserName, false /* createPersistentCookie */);
                    SessionHelper.CreateFirstTimeDefaults(model.UserName);
                    return RedirectToAction(MVC.Home.Index());
                }
                ModelState.AddModelError("", AccountValidation.ErrorCodeToString(createStatus));
            }

            // If we got this far, something failed, redisplay form
            ViewModel.PasswordLength = MembershipService.MinPasswordLength;
            return View(model);
        }

        // **************************************
        // URL: /Account/ChangePassword
        // **************************************

        [Authorize]
        public virtual ActionResult ChangePassword()
        {
            ViewModel.PasswordLength = MembershipService.MinPasswordLength;
            return View();
        }

        [Authorize]
        [HttpPost]
        public virtual ActionResult ChangePassword(ChangePasswordModel model)
        {
            if (ModelState.IsValid)
            {
                if (MembershipService.ChangePassword(User.Identity.Name, model.OldPassword, model.NewPassword))
                {
                    return RedirectToAction(Actions.ChangePasswordSuccess());
                }
                ModelState.AddModelError("", "The current password is incorrect or the new password is invalid.");
            }

            // If we got this far, something failed, redisplay form
            ViewModel.PasswordLength = MembershipService.MinPasswordLength;
            return View(model);
        }

        // **************************************
        // URL: /Account/ChangePasswordSuccess
        // **************************************

        public virtual ActionResult ChangePasswordSuccess()
        {
            return View();
        }
    }
}
