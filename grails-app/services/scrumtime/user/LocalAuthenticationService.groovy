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
import scrumtime.user.SystemUser
import scrumtime.user.SystemUserCredential
import scrumtime.user.UserInformation
import java.security.MessageDigest

class LocalAuthenticationService {

    boolean transactional = true

    def createSystemUserCredential(def params, def systemUser) {
        def systemUserCredential = new SystemUserCredential(systemUser: systemUser)
        systemUserCredential.properties = params
        systemUserCredential.validate()

        if (!systemUserCredential.hasErrors()) {
            if (systemUserCredential.password != systemUserCredential.retypedPassword) {
                systemUserCredential.errors.rejectValue('password',
                    'scrumtime.user.SystemUserCredential.password.notmatching.error')
            } else if (systemUserCredential.password.length() < 4 || systemUserCredential.password.length() > 25) {
                systemUserCredential.errors.rejectValue('password',
                    'scrumtime.user.SystemUserCredential.password.length.error')
                systemUserCredential.errors.rejectValue('retypedPassword',
                    'scrumtime.user.SystemUserCredential.password.length.error')
            } else {
                systemUserCredential.password = hashPassword(systemUserCredential.password)
            }
        }
        return systemUserCredential
    }

    def AuthenticationToken authenticateUser(String username,
                                             String challengePassword) {
        def authenticationToken = new AuthenticationToken()
        def systemUser = SystemUser.findByUsername(username)
        if (systemUser && challengePassword) {
            if (systemUser.enabled) {
                def userInformation = UserInformation.findBySystemUser(systemUser)
                if (userInformation && userInformation.acceptedUserAgreement &&
                    userInformation.emailVerified) {
                    def credential = SystemUserCredential.findBySystemUser(systemUser)
                    if (credential) {
                        def hashedChallengePassword = hashPassword(challengePassword)
                        if (credential.password == hashedChallengePassword) {
                            authenticationToken.systemUser = systemUser
                            authenticationToken.timeOfAuthentication = new Date()
                            authenticationToken.save()
                        } else {
                            authenticationToken.errors.rejectValue('systemUser',
                                'scrumtime.user.AuthenticationToken.systemUser.invalid.error')
                        }
                    } else {
                        authenticationToken.errors.rejectValue('systemUser',
                            'scrumtime.user.AuthenticationToken.systemUser.invalid.error')
                    }
                } else {
                    authenticationToken.errors.rejectValue('systemUser',
                        'scrumtime.user.AuthenticationToken.systemUser.notverified.error')
                }
            } else {
                authenticationToken.errors.rejectValue('systemUser',
                    'scrumtime.user.AuthenticationToken.systemUser.disabled.error')
            }
        } else {
            authenticationToken.errors.rejectValue('systemUser',
                'scrumtime.user.AuthenticationToken.systemUser.invalid.error')
        }
        return authenticationToken
    }

    /**
     * Returns the new SystemUserCredential.
     */
    def SystemUserCredential resetPassword(SystemUser systemUser,
                                           String currentPassword,
                                           String newPassword) {
        def hashedcurrentPassword = hashPassword(currentPassword)
        def systemUserCredential = SystemUserCredential.findBySystemUser(systemUser)
        if (systemUserCredential) {
            if (systemUserCredential.password == hashedcurrentPassword) {

            } else {
                // The current password did not match
                systemUserCredential.errors.rejectValue('password',
                    'scrumtime.user.SystemUserCredential.password.invalid.error')
            }
        } else {
            systemUserCredential = new SystemUserCredential()
            // Credential could not be found
            systemUserCredential.errors.rejectValue('password',
                'scrumtime.user.SystemUserCredential.invalid.error')
        }
        return systemUserCredential
    }

    private String hashPassword(String password) {
        String hashedPassword = ""
        if (password) {
            MessageDigest sha = MessageDigest.getInstance("SHA-1")
            sha.update(password.getBytes())
            byte[] hash = sha.digest()
            hashedPassword = new String(hash)
        }
        return hashedPassword
    }
}