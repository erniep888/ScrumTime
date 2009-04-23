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

import scrumtime.lookup.LocaleLookup
import scrumtime.lookup.TimeZoneLookup
import scrumtime.user.SystemUser
import scrumtime.user.SystemUserCredential
import scrumtime.user.UserInformation

class RegistrationController {
    def systemUserService
    def userInformationService
    def cookieService
    def localAuthenticationService
    def jcaptchaService
    def mailService

    def allowedMethods = [index: ['GET'], register: ['POST'],
        registrationSaved: ['GET', 'POST'], activate: ['GET', 'POST']]

    def index = {
        def systemUser = new SystemUser()
        def systemUserCredential = new SystemUserCredential()
        def userInformation = new UserInformation(languageTwoLetterISO639: 'en', timeZoneId: 'America/Atikokan')

        def timeZones = TimeZoneLookup.findAllBySupported(true, [sort: "shortName"])
        def locales = LocaleLookup.findAllBySupported(true, [sort: "displayLanguage"])
        render(view: '/user/registration',
            model: [systemUser: systemUser,
                userInformation: userInformation,
                systemUserCredential: systemUserCredential,
                timeZones: timeZones, locales: locales])
    }

    def register = {
        def systemUser = systemUserService.createSystemUser(params)
        def systemUserCredential = localAuthenticationService.createSystemUserCredential(params, systemUser)
        def userInformation = userInformationService.createUserInformation(params, systemUser)

        SystemUser.withTransaction {status ->
            if (!systemUser.hasErrors())
                systemUser.save()
            if (!systemUserCredential.hasErrors())
                systemUserCredential.save()
            if (!userInformation.hasErrors())
                userInformation.save()

            if (systemUser.hasErrors() || systemUserCredential.hasErrors() ||
                userInformation.hasErrors()) {
                status.setRollbackOnly()
                userInformation.errors.each { log.error it }
                systemUserCredential.errors.each { log.error it }
                systemUser.errors.each { log.error it }
                def timeZones = TimeZoneLookup.findAllBySupported(true, [sort: "shortName"])
                def locales = LocaleLookup.findAllBySupported(true, [sort: "displayLanguage"])
                systemUserCredential.password = systemUserCredential.retypedPassword
                render(view: '/user/registration',
                    model: [systemUser: systemUser,
                        userInformation: userInformation,
                        systemUserCredential: systemUserCredential,
                        timeZones: timeZones, locales: locales])
                return
            } else {
                chain(action: 'registrationSaved',
                    model: [code: userInformation.validationCode,
                        systemUser: systemUser])
                return
            }
        }
    }
    def registrationSaved = {
        if (!chainModel) {
            render 'Invalid request'
            return
        }
        def code = chainModel["code"]
        def systemUser = chainModel["systemUser"]
        if (code && systemUser) {
            def userInformation = UserInformation.findBySystemUser(systemUser)
            if (userInformation?.validationCode.longValue() == code.longValue()) {
                sendEmailVerification(userInformation)
                render(view: '/user/registrationSaved',
                    model: [username: systemUser.username])
            } else {
                render "no result"
            }

        } else {
            render "no result"
        }

    }

    private void sendEmailVerification(def userInformation) {
        log.info(message(code: 'registration.email.html',
            args: [grailsApplication.config.grails.secureProtocol,
                grailsApplication.config.grails.domainName +
                    grailsApplication.config.grails.webAppPath,
                userInformation.systemUser.id,
                userInformation.validationCode,
                userInformation.systemUser.username,
                userInformation.systemUser.nickName]))
        mailService.sendMail {
            to userInformation.systemUser.username
            from "donotreply@inclinesolutions.com"
            subject(message(code: 'registration.email.subject'))
            html(message(code: 'registration.email.html',
                args: [grailsApplication.config.grails.secureProtocol,
                    grailsApplication.config.grails.domainName +
                        grailsApplication.config.grails.webAppPath,
                    userInformation.systemUser.id,
                    userInformation.validationCode,
                    userInformation.systemUser.username,
                    userInformation.systemUser.nickName]))
        }
    }

    def activate = {
        def success = false
        def systemUser
        if (params.uid && params.act) {
            SystemUser.withTransaction {status ->
                systemUser = SystemUser.get(params.uid)
                def userInformation = UserInformation.findBySystemUser(systemUser)
                if (params.act) {
                    try {
                        def codeFromUrl = new Long(params.act)
                        if (codeFromUrl == userInformation.validationCode) {
                            userInformation.emailVerified = true
                            systemUser.enabled = true
                            systemUser.save(flush: true)
                            userInformation.save(flush: true)
                            success = true
                        }
                    } catch (Exception e) {
                        log.error e.getMessage()
                        status.setRollbackOnly()
                    }
                }
            }
        }
        render(view: '/user/registrationActivated',
            model: [activationSuccess: success,
                username: systemUser?.username])
    }

}
