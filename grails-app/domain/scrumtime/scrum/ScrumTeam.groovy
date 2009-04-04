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
package scrumtime.scrum

import scrumtime.user.SystemUser

class ScrumTeam {
    String name
    String description
    static hasMany = [pigs : SystemUser, chickens : SystemUser, scrumMasters: SystemUser, scribes:SystemUser]
    SortedSet pigs
    SortedSet chickens
    SortedSet scrumMasters
    SortedSet scribes
    String visibility

    static constraints = {
		name(blank:false, unique:true, nullable:false, size:1..80)
        description(size:0..512)
        visibility(nullable:false, blank:false)
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
