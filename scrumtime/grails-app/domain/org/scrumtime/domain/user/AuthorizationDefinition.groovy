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
package org.scrumtime.domain.user

class AuthorizationDefinition {
    SystemUser systemUser
    static hasMany = [assignedRoles: SystemRole]
    static belongsTo = SystemRole
    List uniquePermissionList  // normalized list of all permission...not persisted, set only at login
    static transients = ['uniquePermissionList']

    def String toString() {
        def roles = ''
        assignedRoles?.each() {role ->
            roles += role.toString()
        }
        return systemUser.toString() + " " + roles;
    }

    static constraints = {
        systemUser(nullable: false)
    }
}
