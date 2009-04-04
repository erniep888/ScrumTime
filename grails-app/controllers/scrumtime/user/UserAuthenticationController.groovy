/**
 *  Copyright 2008   scrumtime.org owners
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at 
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0 
 *
 *  Unless required by applicable law or agreed to in writing, software 
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
 *  See the License for the specific language governing permissions and 
 *  limitations under the License. 
 *
**/
package scrumtime.user

import scrumtime.user.SystemUser
import javax.servlet.http.Cookie
import scrumtime.user.UserCookie
import scrumtime.user.UserSettings

class UserAuthenticationController {
    def userSessionService

    def login = {
        if (params.username && params.password) {
            def userIdentity = userSessionService.loginDBRealmUser(params.username, params.password)
            if (!userIdentity.hasErrors) {
                session.userIdentity = userIdentity
                if (params.rememberMe) {
                    Cookie userCookie = generateUserCookie(request, params.username)
                    response.addCookie(userCookie)
                }
                session.userSettings = UserSettings.findBySystemUser(userIdentity.authenticationToken.systemUser)

            } else {
                if (userIdentity.authenticationToken &&
                        userIdentity.authenticationToken.hasErrors()) {
                    flash.message = message(error: userIdentity.authenticationToken.errors.allErrors.get(0))
                } else if (userIdentity.authorizationDefinition &&
                        userIdentity.authorizationDefinition.hasErrors()) {
                    flash.message = message(error: userIdentity.authorizationDefinition.errors.allErrors.get(0))
                } else {
                    flash.message = message(code: 'login.general.error')
                }
            }
        } else {
            flash.message = message(code: 'org.scrumtime.domain.user.AuthenticationToken.systemUser.invalid.error')
        }
        redirect(controller: "home", action: "index")
    }

    def logout = {
        if (session.userIdentity) {
            try {
                Cookie userCookie = disableUserCookie(request,
                        session.userIdentity.authenticationToken?.systemUser?.username)
                if (userCookie)
                    response.addCookie(userCookie)
            } catch (Exception ex) {}
            session.userIdentity = null
        }

        redirect(controller: "home", action: "index")
    }

    private Cookie generateUserCookie(def request, def username) {
        Cookie actualCookie
        SystemUser systemUser = SystemUser.findByUsername(username)
        if (systemUser) {
            def maxAge = 60 * 60 * 24 * 14 // valid for two weeks
            actualCookie = request.cookies.find { it.name == "scrumtime.user" }
            UserCookie dbCookie = UserCookie.findBySystemUser(systemUser)
            String randomValue = System.currentTimeMillis()
            if (!actualCookie) {
                actualCookie = new Cookie('scrumtime.user', systemUser.username + "|" + randomValue)
            }
            if (!dbCookie)
                dbCookie = new UserCookie()
            dbCookie.systemUser = systemUser
            dbCookie.maxAge = maxAge
            dbCookie.randomValue = randomValue
            dbCookie.save()

            actualCookie.maxAge = maxAge
            actualCookie.value = systemUser.username + "|" + randomValue
            actualCookie.name = 'scrumtime.user'
            actualCookie.path = request.getContextPath()

            if (!dbCookie.validate()) {
                actualCookie.name = 'scrumtime.user'
                actualCookie.maxAge = 0
            }
        }
        return actualCookie
    }

    private Cookie disableUserCookie(def request, def username) {
        Cookie actualCookie
        SystemUser systemUser = SystemUser.findByUsername(username)
        if (systemUser) {
            actualCookie = request.cookies.find { it.name == "scrumtime.user" }
            if (actualCookie) {
                actualCookie.maxAge = 0
                actualCookie.name = 'scrumtime.user'
                actualCookie.path = request.getContextPath()
                UserCookie dbCookie = UserCookie.findBySystemUser(systemUser)
                if (dbCookie && !dbCookie.hasErrors())
                    dbCookie.delete()
            }
        }
        return actualCookie
    }


}
