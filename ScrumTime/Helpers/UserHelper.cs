using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Principal;
using ScrumTime.Models;
using ScrumTime.Services;

namespace ScrumTime.Helpers
{
    public class UserHelper
    {
        public static bool IsAuthorized(IIdentity identity, string webResource)
        {
            bool authorized = false;
            if (identity != null && identity.Name != null &&
                identity.Name.Length > 0)
            {
                // TODO: use a DB lookup in the future to restrict specific web resources
                authorized = true;
            }

            return authorized;
        }

    }
}