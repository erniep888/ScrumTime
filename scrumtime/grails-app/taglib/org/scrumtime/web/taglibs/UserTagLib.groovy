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
package org.scrumtime.web.taglibs

import javax.servlet.http.Cookie
import org.scrumtime.service.user.UserIdentity

class UserTagLib {
    def userSessionService

    static namespace = 'systemuser'

    def ifIsLoggedIn = {attrs, body ->
        if (session.userIdentity?.authenticationToken) {
            out << body()
        }
    }

    def ifNotLoggedIn = {attrs, body ->
        if (!session.userIdentity?.authenticationToken) {
            out << body()
        }
    }

    def ifIsAuthorized = {attrs, body ->
        if (session.userIdentity?.authorizationDefinition && attrs.requiredPermissions) {
            if (session.userIdentity?.
                    authorizationDefinition?.
                    uniquePermissionList.containsAll(attrs.requiredPermissions)) {
                out << body()
            }
        }
    }

    def useCookieLogin = {
        if (!session.userIdentity){
            Cookie requestCookie = request.cookies.find { it.name == "scrumtime.user" }
            if (requestCookie){
                UserIdentity userIdentity = userSessionService.loginDBRealmUser(requestCookie)
                if (userIdentity && !userIdentity.hasErrors){
                    session.userIdentity = userIdentity
                }
            }
        }
    }
}
