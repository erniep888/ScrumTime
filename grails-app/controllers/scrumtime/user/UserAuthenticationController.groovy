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

import javax.servlet.http.Cookie

class UserAuthenticationController {
    def localAuthenticationService
    def cookieService

    def index = {
        render(view: '/user/localLogin')
    }

    def login = {
        if (params.username && params.password) {
            def authenticationToken = localAuthenticationService.authenticateUser(params.username, params.password)
            if (!authenticationToken?.hasErrors()) {
                session.authenticationToken = authenticationToken
                if (params.rememberMe) {
                    Cookie userCookie = cookieService.generateUserCookie(request, params.username)
                    response.addCookie(userCookie)
                }
                redirect(uri: "/")
            } else {
                if (authenticationToken && authenticationToken.hasErrors()) {
                    flash.message = message(error: authenticationToken.errors.allErrors.get(0))
                } else {
                    flash.message = message(code: 'locallogin.general.error')
                }
            }
        } else {
            flash.message = message(code: 'scrumtime.user.AuthenticationToken.systemUser.invalid.error')
        }
        render(view: '/user/localLogin')
    }

    def logout = {
        if (session.authenticationToken) {
            try {
                Cookie userCookie = cookieService.disableUserCookie(request,
                    session?.authenticationToken?.systemUser?.username)
                if (userCookie)
                    response.addCookie(userCookie)
            } catch (Exception ex) {}
            session.authenticationToken = null
        }

        redirect(uri: "/")
    }


}