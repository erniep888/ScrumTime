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
package scrumtime.taglibs

import javax.servlet.http.Cookie
import scrumtime.user.UserIdentity
import scrumtime.user.UserSettings

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

    def useCookieLogin = {
        def userIdentity = session?.getAttribute('userIdentity')
        if (!userIdentity){
            userIdentity = userSessionService.loginDBRealmUser("userx@demo.com", "userx")
            session.setAttribute('userIdentity',userIdentity)
            def userSettings = UserSettings.get(1)
            session.setAttribute('userSettings', userSettings)
        }
//        if (!userIdentity){
//            Cookie requestCookie = request.cookies.find { it.name == "scrumtime.user" }
//            if (requestCookie){
//                userIdentity = userSessionService.loginDBRealmUser(requestCookie)
//                if (userIdentity && !userIdentity.hasErrors){
//                    session.setAttribute('userIdentity', userIdentity)
//                }
//            }
//        }
    }
}
