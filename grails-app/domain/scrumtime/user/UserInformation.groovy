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
package scrumtime.user

import scrumtime.common.VisibilityType
import scrumtime.common.PrioritizedTimeZone
import scrumtime.common.PrioritizedLanguage

class UserInformation {
    SystemUser systemUser
    static belongsTo = SystemUser 
    Date dateCreated
	Date lastUpdated    
    String firstName
    String lastName
    String nickName
    PrioritizedTimeZone timeZone
    PrioritizedLanguage language
    String captchaResponse
    Boolean emailVerified = false
    Long validationCode

    static transients = ['captchaResponse']

    static constraints = {
        systemUser(nullable: false)
        firstName(blank:false,length:1..50)
        lastName(length:1..50)
        nickName(unique:true,blank:false,length:1..50)
        timeZone(nullable: true)
        language(nullable: true)
        validationCode(nullable: true)
    }

    static mapping = {
        systemUser cascade:"save-update"
    }

    public boolean equals(Object obj) {
        def same = false
        if (obj instanceof UserInformation){
            same= true;
        }
        return same
    }


}
