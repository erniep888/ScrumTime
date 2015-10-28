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

import org.scrumtime.domain.organization.Organization
import org.scrumtime.domain.product.Product
import org.scrumtime.domain.release.Release
import org.scrumtime.domain.scrum.ScrumTeam
import org.scrumtime.domain.sprint.Sprint

class UserSettings {
    SystemUser systemUser
    static belongsTo = [SystemUser]
    Date dateCreated
	Date lastUpdated    
    Organization currentOrganization
    Product currentProduct
    Release currentRelease
    Sprint currentSprint
    ScrumTeam currentScrumTeam
    static hasMany = [memberOfOrganizations : Organization]
    SortedSet memberOfOrganizations
    static constraints = {
		currentOrganization(nullable:true)
        currentProduct(nullable:true)
        currentRelease(nullable:true)
        currentSprint(nullable:true)
        currentScrumTeam(nullable:true)
    }
}
