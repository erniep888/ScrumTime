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
package org.scrumtime.service

import org.scrumtime.domain.user.AuthorizationDefinition
import org.scrumtime.domain.user.SystemUser
import org.scrumtime.domain.user.SystemRole
import org.scrumtime.domain.user.AuthenticationToken

class AuthorizationService {

    boolean transactional = true

    def AuthorizationDefinition createAndDoNotSaveAuthDefinition(SystemUser systemUser) {
        def authorizationDefinition = new AuthorizationDefinition()
        def role
        if (SystemUser.count() == 0){
            role = SystemRole.findByName('SITE OWNER')
        } else {
            role = SystemRole.findByName('GENERAL USER')
        }
        authorizationDefinition.systemUser = systemUser
        authorizationDefinition.assignedRoles = [role]
        return authorizationDefinition
    }

    def AuthorizationDefinition authorizeUser(AuthenticationToken authenticationToken){
        def authorizationDefinition = new AuthorizationDefinition()
        if (authenticationToken && authenticationToken.systemUser &&
                !authenticationToken.hasErrors()){
            authorizationDefinition = AuthorizationDefinition.
                    findBySystemUser(authenticationToken.systemUser)
            authorizationDefinition = setUniquePermissionList(authorizationDefinition)
        } else {
            authorizationDefinition.errors.rejectValue('systemUser',
                    'org.scrumtime.domain.user.AuthorizationDefinition.systemUser.invalid.error')
        }
        return authorizationDefinition
    }

    private AuthorizationDefinition setUniquePermissionList(AuthorizationDefinition authorizationDefinition){
        List permissionList = new Vector()
        if (authorizationDefinition && authorizationDefinition.assignedRoles){
            authorizationDefinition.assignedRoles.each{ role ->
                if (role.permissions){
                    role.permissions.each{ permission ->
                        if (permission && permission.name &&
                                !permissionList.contains(permission.name)){
                            permissionList.add(permission.name)
                        }
                    }
                }
            }
        }
        authorizationDefinition.uniquePermissionList = permissionList
        return authorizationDefinition
    }

}
