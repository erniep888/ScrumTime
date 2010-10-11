using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ScrumTime.Models;

namespace ScrumTime.Services
{
    public class UserSettingService
    {
        ScrumTimeEntities _ScrumTimeEntities;

        public UserSettingService(ScrumTimeEntities scrumTimeEntities)
        {
            _ScrumTimeEntities = scrumTimeEntities;
        }

        public static UserSetting GetUserSettingByUsername(ScrumTimeEntities scrumTimeEntities, string username)
        {
            UserSetting userSetting = null;
            var results = from u in scrumTimeEntities.UserSettings
                          where u.Username == username
                          select u;
            if (results.Count() > 0)
                userSetting = results.First<UserSetting>();
            return userSetting;
        }

        public UserSetting GetUserSettingByUsername(string username)
        {
            return GetUserSettingByUsername(_ScrumTimeEntities, username);
        }

        public UserSetting SaveUserSetting(UserSetting userSetting)
        {
            if (userSetting != null)
            {
                if (userSetting.UserSettingId == 0)  // this is new
                {
                    _ScrumTimeEntities.AddToUserSettings(userSetting);
                }
                else  // the userSetting exists
                {
                    _ScrumTimeEntities.AttachTo("UserSettings", userSetting);

                    ScrumTimeEntities freshScrumTimeEntities =
                        new ScrumTimeEntities(_ScrumTimeEntities.Connection.ConnectionString);
                    UserSetting existingUserSetting = GetUserSettingByUsername(freshScrumTimeEntities, userSetting.Username);
                    if (existingUserSetting == null)
                    {
                        throw new Exception("The user setting no longer exists.");
                    }
                    _ScrumTimeEntities.ObjectStateManager.ChangeObjectState(userSetting, System.Data.EntityState.Modified);
                }
                _ScrumTimeEntities.SaveChanges();
            }
            return userSetting;
        }

        public void DeleteUserSetting(string username)
        {
            UserSetting existingUserSetting = GetUserSettingByUsername(username);

            if (existingUserSetting != null && existingUserSetting.Username.Length > 0)
            {
                _ScrumTimeEntities.DeleteObject(existingUserSetting);
                _ScrumTimeEntities.SaveChanges();
            }
            else
                throw new Exception("You have attempted to delete a user setting that does not exist.");
        }

    }
}