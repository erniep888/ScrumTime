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

import org.scrumtime.domain.user.SystemUser
import org.scrumtime.domain.user.UserInformation
import org.scrumtime.domain.common.PrioritizedLanguage
import org.scrumtime.domain.common.PrioritizedTimeZone
import org.scrumtime.domain.common.VisibilityType
import org.scrumtime.domain.user.SystemUserCredential
import org.scrumtime.domain.organization.Organization
import org.scrumtime.domain.product.Product
import org.scrumtime.domain.release.Release
import org.scrumtime.domain.sprint.Sprint
import org.scrumtime.domain.scrum.ScrumTeam
import org.scrumtime.domain.user.UserSettings

class RegistrationController {
    def jcaptchaService
    def userManagmentService
    def mailService
    def productService
    def releaseService
    def sprintService
    def scrumService

    def allowedMethods = [index: ['POST', 'GET'], activate: ['GET', 'POST'],
            success: ['POST']]
    def afterInterceptor = {model ->
        model.hideLogin = 'true'
    }

    def index = {
        SystemUser systemUser = new SystemUser()
        systemUser.properties = params

        UserInformation userInformation = new UserInformation()
        userInformation.properties = params
        userInformation.validationCode = new Date().getTime()

        SystemUserCredential systemUserCredential = new SystemUserCredential()
        systemUserCredential.properties = params

        if (params.selectedLanguage) {
            userInformation.language = PrioritizedLanguage.get(params.selectedLanguage)
        }
        if (params.selectedTimeZone) {
            userInformation.timeZone = PrioritizedTimeZone.get(params.selectedTimeZone)
        }
        if (params.selectedVisibility) {
            userInformation.visibilityType = VisibilityType.get(params.selectedVisibility)
        }

        if (userInformation.captchaResponse && session.id) {
            if (!validCaptcha(userInformation.captchaResponse, session.id)) {
                userInformation.captchaResponse = null
            }
        }
        try {
            if (systemUser.username) {
                userManagmentService.registerDBRealmUser(systemUser,
                        systemUserCredential, userInformation)
                if (!systemUser.hasErrors() && !systemUserCredential.hasErrors()
                        && !userInformation.hasErrors()) {
                    sendEmailVerification(request, systemUser, userInformation)
                    render(view: '/org/scrumtime/web/views/user/registration/registration',
                            model: [success: true, username: systemUser.username,
                                    breadCrumbTrail:'Registration Success'])
                    return
                } else {
                    userInformation.errors.each { println it }  // TODO: log this
                    systemUserCredential.errors.each { println it } // TODO: log this
                    systemUser.errors.each { println it }  // TODO: log this
                }
            }
        } catch (Exception ex) {
            println ex.getMessage()
            // TODO: log this
        }

        render(view: '/org/scrumtime/web/views/user/registration/registration',
                model: [systemUser: systemUser, userInformation: userInformation,
                        systemUserCredential: systemUserCredential,
                        languages: PrioritizedLanguage.listOrderByDisplayLanguage(),
                        timeZones: PrioritizedTimeZone.listOrderByShortForm(),
                        breadCrumbTrail:'Registration',
                        visibilities: VisibilityType.findAll()])
    }

    private boolean validCaptcha(def captcha, def sessionId) {
        def valid = false
        try {
            if (jcaptchaService.validateResponse(
                    "imageCaptcha", sessionId, captcha)) {
                valid = true
            }
        } catch (Exception ex) {
            valid = false
        }
        return valid
    }

    private void sendEmailVerification(def request, def systemUser, def userInformation) {

        mailService.sendMail {
            to systemUser.username
            from "donotreply@inclinesolutions.com"
            subject "Welcome to Scrum Time"
            html """You have registered for an account on the Scrum Time website.<br><br>
                            In order to activate your account, you must follow this link:<br><br>
                            <a href="${request.scheme}://www.scrumtime.net/registration/activate?uid=${systemUser.id}&act=${userInformation.validationCode}">
                            ${request.scheme}://www.scrumtime.net/registration/activate?uid=${systemUser.id}&act=${userInformation.validationCode}</a>
                            <br><br>
                            Your account information is as follows:<br>
                            -------------------------------------<br>
                            User Name: ${systemUser.username}<br>
                            Nick Name: ${userInformation.nickName}<br><br>

                            Sincerely,<br>
                            Scrum Time Team"""
        }
    }

    /**
     * Handles the validation url that enables user accounts.
     */
    def activate = {
        def success = false
        def systemUser
        if (params.uid && params.act) {
            systemUser = SystemUser.get(params.uid)
            def userInformation = UserInformation.findBySystemUser(systemUser)
            if (params.act) {
                try {
                    def codeFromUrl = new Long(params.act)
                    if (codeFromUrl == userInformation.validationCode) {
                        userInformation.emailVerified = true
                        userInformation.save(flush:true)
                        autoCreateAll(systemUser, session)
                        success = true                        
                    }
                } catch (Exception e) {
                    println e.getMessage() // TODO: log this
                }
            }
        }
        render(view: '/org/scrumtime/web/views/user/registration/registration',
                model: [activation: true, activationSuccess: success,
                        username: systemUser?.username,
                        breadCrumbTrail:'Registration Activation'])
    }

    def success = {
        render(view: '/org/scrumtime/web/views/user/registration/registration',
                model: [success: 'true', username: params.username])
    }

    private void autoCreateAll(SystemUser systemUser, def session){
        UserInformation userInfo = UserInformation.findBySystemUser(systemUser)
        def scrumtimeOrg = Organization.findByName('scrumtime.org')
        scrumtimeOrg.members.add(systemUser)
        scrumtimeOrg.save(flush:true)
        def product = productService.autoCreate(scrumtimeOrg, systemUser.username, userInfo.nickName)
        def release = releaseService.autoCreate(product, systemUser.username)
        def sprint = sprintService.autoCreate(release, systemUser.username)
        def scrumTeam = scrumService.autoCreateScrumTeam(scrumtimeOrg, systemUser.username, userInfo.nickName)
        def userSettings = new UserSettings(systemUser:systemUser,
            currentOrganization:scrumtimeOrg, currentProduct:product,
            currentRelease:release, currentSprint:sprint,
            currentScrumTeam: scrumTeam
        )
        userSettings.save()
        session.userSettings = userSettings
    }
}
