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

class UserInformation {
    SystemUser systemUser
    static belongsTo = SystemUser
    Date dateCreated
    Date lastUpdated
    String firstName
    String lastName
    String nickName
    String timeZoneId
    String languageTwoLetterISO639
    Boolean acceptedUserAgreement = false
    String captchaResponse
    Boolean emailVerified = false
    Long validationCode

    static transients = ['captchaResponse']

    static constraints = {
        firstName(nullable: true)
        lastName(nullable: true)
        timeZoneId(nullable: false)
        languageTwoLetterISO639(nullable: false)
        systemUser(nullable: false)
        nickName(blank: false, unique: true, nullable: false, length: 1..50)
    }

    static mapping = {
        systemUser cascade: "save-update"
    }

    public boolean equals(Object obj) {
        def same = false
        if (obj instanceof UserInformation) {
            same = true;
        }
        return same
    }
}
