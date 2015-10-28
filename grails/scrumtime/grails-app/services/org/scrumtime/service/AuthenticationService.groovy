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
 * */
package org.scrumtime.service

import org.scrumtime.domain.user.SystemUserCredential
import java.security.MessageDigest
import org.scrumtime.domain.user.AuthenticationToken
import org.scrumtime.domain.user.SystemUser
import org.scrumtime.domain.user.UserInformation
import javax.servlet.http.Cookie
import org.scrumtime.domain.user.UserCookie

class AuthenticationService {
    boolean transactional = true

    def AuthenticationToken authenticateUser(String username,
                                             String challengePassword) {
        def authenticationToken = new AuthenticationToken()
        def systemUser = SystemUser.findByUsername(username)
        if (systemUser && challengePassword) {
            if (systemUser.enabled) {
                def userInformation = UserInformation.findBySystemUser(systemUser)
                if (userInformation && userInformation.emailVerified) {
                    def credential = SystemUserCredential.findBySystemUser(systemUser)
                    if (credential) {
                        def hashedChallengePassword = hashPassword(challengePassword)
                        if (credential.password == hashedChallengePassword) {
                            authenticationToken.systemUser = systemUser
                            authenticationToken.timeOfAuthentication = new Date()
                            authenticationToken.save()
                            authenticationToken.errors.allErrors.each {
                                println it
                            }
                        } else {
                            authenticationToken.errors.rejectValue('systemUser',
                                    'org.scrumtime.domain.user.AuthenticationToken.systemUser.invalid.error')
                        }
                    } else {
                        authenticationToken.errors.rejectValue('systemUser',
                                'org.scrumtime.domain.user.AuthenticationToken.systemUser.invalid.error')
                    }
                } else {
                    authenticationToken.errors.rejectValue('systemUser',
                            'org.scrumtime.domain.user.AuthenticationToken.systemUser.notverified.error')
                }
            } else {
                authenticationToken.errors.rejectValue('systemUser',
                        'org.scrumtime.domain.user.AuthenticationToken.systemUser.disabled.error')
            }
        } else {
            authenticationToken.errors.rejectValue('systemUser',
                    'org.scrumtime.domain.user.AuthenticationToken.systemUser.invalid.error')
        }
        return authenticationToken
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

    /**
     * Returns the new SystemUserCredential.
     */
    def SystemUserCredential resetPassword(SystemUser systemUser,
                                           String currentPassword,
                                           String newPassword) {

    }

    def String hashPassword(String password) {
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
