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

import org.scrumtime.domain.user.SystemUser
import org.scrumtime.domain.scrum.ScrumTeam
import org.scrumtime.domain.scrum.ScrumRole
import org.scrumtime.domain.organization.Organization
import org.scrumtime.domain.scrum.ScrumTeamMember

class ScrumService {

    boolean transactional = true

    def ScrumTeam autoCreateScrumTeam(Organization organization, String username, String nickName) {
        def scrumTeam
        def systemUser = SystemUser.findByUsername(username)
        if (systemUser) {
            def scrumMaster = ScrumRole.findByName('Scrum Master')
            def scrumTeamMember = new ScrumTeamMember(systemUser:systemUser, roles:[scrumMaster])
            scrumTeam = new ScrumTeam(organization: organization,
                    name: nickName + '_scrum team', description: 'Auto generated scrum team for ' + organization.name,
                    createdBy: username, members: [scrumTeamMember])
            scrumTeam.save(flush: true)
        }
        return scrumTeam
    }
}
