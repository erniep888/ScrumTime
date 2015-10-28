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
package org.scrumtime.web.controller.user

import org.scrumtime.service.UserManagmentService
import org.scrumtime.domain.common.VisibilityType
import org.scrumtime.domain.user.SystemUser
import org.scrumtime.domain.user.UserInformation

class UserManagementController {

    UserManagmentService userManagmentService

    def index = {
        def output = ''
        def users = SystemUser.findAll()
        if (users){
            output = users.get(0).toString()
        } else {
            VisibilityType publicVisibility = new VisibilityType(name:'public')
            SystemUser newUser = new SystemUser(
                        username: 'epaschall@inclinesolutions.com',
                        enabled: true)
            UserInformation userInformation = new UserInformation(
                        systemUser: newUser, firstName: 'Ernie',
                        lastName: 'Paschall', visibilityType: publicVisibility)            
            userManagmentService.createDBRealmUser(newUser,
                  'password1', userInformation)
        }

        render (output)
    }
}
