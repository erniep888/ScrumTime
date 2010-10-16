using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Principal;
using ScrumTime.Services;
using ScrumTime.Models;

namespace ScrumTime.Helpers
{
    public class SessionHelper
    {
        public static string CURRENTPRODUCTID = "currentProductId";
        public static string CURRENTSPRINTID = "currentSprintId";
        public static string LASTMAINTABSELECTED = "lastMainTabSelected";

        public static int GetCurrentProductId(string username, HttpSessionStateBase session)
        {
            var value = session[CURRENTPRODUCTID];
            if (value == null)
            {
                // check the db
                UserSetting userSetting = LoadUserSetting(username);
                if (userSetting != null && userSetting.CurrentProduct != null)
                {
                    session[CURRENTPRODUCTID] = userSetting.CurrentProduct;
                    value = userSetting.CurrentProduct;
                }
                else
                    value = -1;
            }
            return (int)value;
        }

        public static void SetCurrentProductId(string username, HttpSessionStateBase session, int value)
        {
            SaveUserSetting(username, CURRENTPRODUCTID, value);
            session[CURRENTPRODUCTID] = value;
        }

        public static int GetCurrentSprintId(string username, HttpSessionStateBase session)
        {
            var value = session[CURRENTSPRINTID];
            if (value == null)
            {
                // check the db
                UserSetting userSetting = LoadUserSetting(username);
                if (userSetting != null && userSetting.CurrentSprint != null)
                {
                    session[CURRENTSPRINTID] = userSetting.CurrentSprint;
                    value = userSetting.CurrentSprint;
                }
                else
                    value = -1;
            }
            return (int)value;
        }

        public static void SetCurrentSprintId(string username, HttpSessionStateBase session, int value)
        {
            SaveUserSetting(username, CURRENTSPRINTID, value);
            session[CURRENTSPRINTID] = value;
        }

        public static int GetLastSelectedMainTabIndex(string username, HttpSessionStateBase session)
        {
            var value = session[LASTMAINTABSELECTED];
            if (value == null)
            {
                // check the db
                UserSetting userSetting = LoadUserSetting(username);
                if (userSetting != null && userSetting.LastMainTabSelected != null)
                {
                    session[LASTMAINTABSELECTED] = userSetting.LastMainTabSelected;
                    value = userSetting.LastMainTabSelected;
                }
                else
                    value = -1;
            }
            return (int)value;
        }

        public static void SetLastSelectedMainTabIndex(string username, HttpSessionStateBase session, int value)
        {
            SaveUserSetting(username, LASTMAINTABSELECTED, value);
            session[LASTMAINTABSELECTED] = value;
        }

        private static UserSetting LoadUserSetting(string username)
        {
            UserSetting userSetting = null;
            if (username != null && username.Length > 0)
            {
                ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
                userSetting = UserSettingService.GetUserSettingByUsername(scrumTimeEntities, username);
            }
            return userSetting;
        }

        private static void SaveUserSetting(string username, string settingName, object value)
        {
            if (value != null && username != null && username.Length > 0)
            {
                ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
                UserSetting existingUserSetting = LoadUserSetting(username);
                if (settingName == CURRENTPRODUCTID)
                    existingUserSetting.CurrentProduct = (int)value;
                else if (settingName == CURRENTSPRINTID)
                    existingUserSetting.CurrentSprint = (int)value;
                else if (settingName == LASTMAINTABSELECTED)
                    existingUserSetting.LastMainTabSelected = (int)value;
                scrumTimeEntities.SaveChanges();
            }
            else
                throw new Exception("Failed to save the user settings for setting: " + settingName);
        }

        public static void CreateFirstTimeDefaults(string username)
        {
            ScrumTimeEntities scrumTimeEntities = new ScrumTimeEntities();
            UserSetting userSetting = UserSettingService.GetUserSettingByUsername(scrumTimeEntities, username);
            if (userSetting == null)
            {
                // Load sample product id
                ProductService productService = new ProductService(scrumTimeEntities);
                int productIdOfSample = productService.GetProductIdOfSample();
                if (productIdOfSample > -1)
                {
                    SprintService sprintService = new SprintService(scrumTimeEntities);
                    List<Sprint> mostRecentSprints = sprintService.GetMostRecentSprints(productIdOfSample, 1);
                    if (mostRecentSprints.Count > 0 && mostRecentSprints[0] != null)
                    {
                        userSetting = new UserSetting()
                        {
                            CurrentProduct = productIdOfSample,
                            CurrentSprint = mostRecentSprints[0].SprintId,
                            LastMainTabSelected = 1,
                            Username = username
                        };
                        scrumTimeEntities.AddToUserSettings(userSetting);
                        scrumTimeEntities.SaveChanges();
                    }
                    
                }                
            }
        }
    }
}