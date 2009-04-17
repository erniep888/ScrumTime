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

import scrumtime.user.UserInformation

class UserInformationService {

    boolean transactional = true

    def createUserInformation(def params, def systemUser) {
        def userInformation = new UserInformation(systemUser: systemUser)
        userInformation.properties = params
        userInformation.validationCode = new Date().getTime()
        userInformation.validate()

        if (!userInformation.acceptedUserAgreement) {
            userInformation.errors.rejectValue('acceptedUserAgreement',
                'scrumtime.user.UserInformation.acceptedUserAgreement.notaccepted.error')
        }
        if (!userInformation.captchaResponse) {
            userInformation.errors.rejectValue('captchaResponse',
                'scrumtime.user.UserInformation.captchaResponse.notmatched.error')
        }

        return userInformation
    }
}