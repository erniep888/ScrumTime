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

import org.scrumtime.domain.organization.Organization
import org.scrumtime.domain.user.SystemUser

class OrganizationService {

    boolean transactional = true

    def save(Organization organization, String orgid) {
        if (!organization) {
            organization = new Organization()
        }

        if (orgid) {
            def existingOrg = Organization.get(orgid)
            existingOrg.name = organization.name
            existingOrg.description = organization.description
            if (existingOrg.validate()) {
                existingOrg.merge()
                organization = existingOrg
            } else {
                existingOrg.discard()
                organization.errors = existingOrg.errors
            }
        } else if (organization.validate()) {
            organization.save()
        }

        return organization
    }

    def findAuthorizedOrganizations(SystemUser systemUser){
        def query = "from org.scrumtime.domain.organization.Organization as org " +
                    "where :systemUser in elements(org.members)"
        def results = Organization.findAll(query,[systemUser:systemUser])
        return results
    }
}
