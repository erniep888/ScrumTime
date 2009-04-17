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

import scrumtime.user.SystemUser

class SystemUserService {

    boolean transactional = true

    def createSystemUser(def params) {
        def systemUser = new SystemUser()
        systemUser.properties = params
        systemUser.validate()

        if (systemUser.username != systemUser.retypedUsername) {
            systemUser.errors.rejectValue('username',
                'scrumtime.user.SystemUser.username.notmatching.error',
                null, null)
            systemUser.errors.rejectValue('retypedUsername',
                'scrumtime.user.SystemUser.retypedUsername.notmatching.error',
                null, null)
        }

        if (!systemUser.hasErrors()) {
            def existingSystemUser = SystemUser.findByUsername(systemUser.username)
            if (existingSystemUser) {
                systemUser.errors.rejectValue('username',
                    'scrumtime.user.SystemUser.username.exists.error',
                    [username] as Object[], null)
            } else {
                log.info("Valid username: $systemUser.username")
            }
        }

        return systemUser
    }
}