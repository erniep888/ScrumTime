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
package org.scrumtime.domain.scrum

import org.scrumtime.domain.organization.Organization

class ScrumTeam {
    String name
    String description
    Organization organization
    static belongsTo = Organization
    static hasMany = [members : ScrumTeamMember]
    String createdBy   // unique username

    static constraints = {
		name(unique:'organization',nullable:false, size:1..80)
        description(size:0..512)
    }

    def int compareTo(obj) {
        def result = 0
        if (obj && obj instanceof ScrumTeam){
            def scrumTeam = (ScrumTeam)obj
            if (this.organization == scrumTeam.organization)
                result = this.name.compareTo(scrumTeam.name)
            else
                result = this.organization.name.compareTo(scrumTeam.organization.name)
        }
        return result
    }
}
