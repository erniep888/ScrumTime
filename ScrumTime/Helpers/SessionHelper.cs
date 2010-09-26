using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ScrumTime.Helpers
{
    public class SessionHelper
    {
        public static string CURRENTPRODUCTID = "currentProductId";
        public static string CURRENTSPRINTID = "currentSprintId";

        public static int GetCurrentProductId(HttpSessionStateBase session)
        {
            return (session[CURRENTPRODUCTID] != null) ? (int)session[CURRENTPRODUCTID] : -1;            
        }

        public static void SetCurrentProductId(HttpSessionStateBase session, int value)
        {
            session[CURRENTPRODUCTID] = value;
        }

        public static int GetCurrentSprintId(HttpSessionStateBase session)
        {
            return (session[CURRENTSPRINTID] != null) ? (int)session[CURRENTSPRINTID] : -1;
        }

        public static void SetCurrentSprintId(HttpSessionStateBase session, int value)
        {
            session[CURRENTSPRINTID] = value;
        }
    }
}