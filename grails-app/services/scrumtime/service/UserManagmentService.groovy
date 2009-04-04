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
package scrumtime.service

import scrumtime.user.SystemUser
import scrumtime.user.UserInformation
import scrumtime.user.SystemUserCredential

class UserManagmentService {
    def authenticationService
    boolean transactional = true

    /**
     * The password is not yet encrypted.
     */
    def registerDBRealmUser(SystemUser systemUser,
                            SystemUserCredential systemUserCredential,
                            UserInformation userInformation) {
        if (systemUser && systemUserCredential && userInformation) {
            userInformation.systemUser = systemUser
            systemUserCredential.systemUser = systemUser
            systemUser.validate()
            systemUserCredential.validate()
            userInformation.validate()

            if (systemUser.retypedUsername != systemUser.username) {
                systemUser.errors.rejectValue('username',
                        'org.scrumtime.domain.user.SystemUser.username.notmatching.error')
                systemUser.errors.rejectValue('retypedUsername',
                        'org.scrumtime.domain.user.SystemUser.retypedUsername.notmatching.error')
            }
            if (systemUserCredential.password != systemUserCredential.retypedPassword) {
                systemUserCredential.errors.rejectValue('password',
                        'org.scrumtime.domain.user.SystemUserCredential.password.notmatching.error')
                systemUserCredential.errors.rejectValue('retypedPassword',
                        'org.scrumtime.domain.user.SystemUserCredential.retypedPassword.notmatching.error')
            } else if (systemUserCredential.password?.length() < 4 ||
                    systemUserCredential.password?.length() > 25) {
                systemUserCredential.errors.rejectValue('password',
                        'org.scrumtime.domain.user.SystemUserCredential.password.length.error')
            }
            if (!userInformation.captchaResponse) {
                userInformation.errors.rejectValue('captchaResponse',
                        'org.scrumtime.domain.user.UserInformation.captchaResponse.notmatched.error')
            }

            if (!systemUser.hasErrors()) {
                if (!systemUserCredential.hasErrors()) {
                    if (!userInformation.hasErrors()) {
                        systemUser.enabled = true
                        systemUser.save()
                        systemUserCredential.password =
                            authenticationService.hashPassword(systemUserCredential.password)
                        systemUserCredential.save()
                        userInformation.save()
                    }
                }
            }
        }
    }

    /**
     * Provides update capability ONLY.
     */
    def updateUserInformation(SystemUser systemUser,
                              UserInformation newUserInformation) {

    }


}
