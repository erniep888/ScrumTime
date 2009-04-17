/**
 *  Copyright 2009   scrumtime.org
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
 * */
package scrumtime.user

import scrumtime.user.AuthenticationToken
import org.springframework.beans.factory.InitializingBean
import scrumtime.user.SystemUser
import scrumtime.user.UserCookie
import javax.servlet.http.Cookie


class CookieService implements InitializingBean {
    def grailsApplication
    def setting

    boolean transactional = true

    def cookieName

    void afterPropertiesSet() {
        this.setting = grailsApplication.config.setting
        cookieName = grailsApplication.config.grails.cookieName
    }


    def AuthenticationToken authenticateUser(Cookie requestCookie) {
        def authenticationToken
        if (requestCookie) {
            StringTokenizer tokenizer = new StringTokenizer(requestCookie.value, "|")
            if (tokenizer.countTokens() == 2) {
                String username = tokenizer.nextToken()
                SystemUser systemUser = SystemUser.findByUsername(username)
                if (systemUser && !systemUser.hasErrors()) {
                    UserCookie dbCookie = UserCookie.findBySystemUser(systemUser)
                    if (dbCookie && !dbCookie.hasErrors()) {
                        String randomValue = tokenizer.nextToken()
                        if (randomValue == dbCookie.randomValue) {
                            authenticationToken = new AuthenticationToken(
                                systemUser: systemUser, timeOfAuthentication: new Date())
                            authenticationToken.save()
                            if (authenticationToken.hasErrors())
                                authenticationToken = null
                        }
                    }
                }
            }
        }
        return authenticationToken
    }

    def Cookie generateUserCookie(def request, def username) {
        Cookie actualCookie
        SystemUser systemUser = SystemUser.findByUsername(username)
        if (systemUser) {
            def maxAge = 60 * 60 * 24 * 14 // valid for two weeks
            actualCookie = request.cookies.find { it.name == cookieName }
            UserCookie dbCookie = UserCookie.findBySystemUser(systemUser)
            String randomValue = System.currentTimeMillis()
            if (!actualCookie) {
                actualCookie = new Cookie(cookieName, systemUser.username + "|" + randomValue)
            }
            if (!dbCookie)
                dbCookie = new UserCookie()
            dbCookie.systemUser = systemUser
            dbCookie.maxAge = maxAge
            dbCookie.randomValue = randomValue
            dbCookie.save()

            actualCookie.maxAge = maxAge
            actualCookie.value = systemUser.username + "|" + randomValue
            actualCookie.name = cookieName
            actualCookie.path = request.getContextPath()

            if (!dbCookie.validate()) {
                actualCookie.name = cookieName
                actualCookie.maxAge = 0
            }
        }
        return actualCookie
    }

    def Cookie disableUserCookie(def request, def username) {
        Cookie actualCookie
        SystemUser systemUser = SystemUser.findByUsername(username)
        if (systemUser) {
            actualCookie = request.cookies.find { it.name == cookieName }
            if (actualCookie) {
                actualCookie.maxAge = 0
                actualCookie.name = cookieName
                actualCookie.path = request.getContextPath()
                UserCookie dbCookie = UserCookie.findBySystemUser(systemUser)
                if (dbCookie && !dbCookie.hasErrors())
                    dbCookie.delete()
            }
        }
        return actualCookie
    }
}
