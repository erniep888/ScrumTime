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
package org.scrumtime.service

import org.scrumtime.service.user.UserIdentity
import javax.servlet.http.Cookie
import org.scrumtime.service.user.SessionUserInformation


class UserSessionService {
    def authenticationService

    boolean transactional = true

    def UserIdentity loginDBRealmUser(String username,
                                      String challengePassword) {
        def authenticationToken = authenticationService.authenticateUser(username, challengePassword)
        def userIdentity = new UserIdentity(authenticationToken: authenticationToken)
        if (!authenticationToken || authenticationToken?.hasErrors())
            userIdentity.hasErrors = true
        return userIdentity
    }

    def UserIdentity loginDBRealmUser(Cookie requestCookie){
        def authenticationToken = authenticationService.authenticateUser(requestCookie)
        def userIdentity = new UserIdentity(authenticationToken: authenticationToken)
        if (!authenticationToken || authenticationToken?.hasErrors())
            userIdentity.hasErrors = true
        return userIdentity
    }

    def List<SessionUserInformation> convertUserListToSessionUserList(def availableUserInfos) {
        def availableSessionUserInfos = new Vector<SessionUserInformation>()
//        def sessionUserInformation = new SessionUserInformation(id: -1,
//                nickName: "-----------", username: "-----------" )
//        availableSessionUserInfos.add(sessionUserInformation)
        availableUserInfos.each {userInformation ->
            def sessionUserInformation = new SessionUserInformation(id: userInformation.systemUser.id,
                    nickName: userInformation.nickName,
                    username: userInformation.systemUser.username)
            availableSessionUserInfos.add(sessionUserInformation)
        }
        return availableSessionUserInfos
    }

}
