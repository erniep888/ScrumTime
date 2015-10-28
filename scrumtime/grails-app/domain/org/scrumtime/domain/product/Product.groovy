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
package org.scrumtime.domain.product

import org.scrumtime.domain.organization.Organization
import org.scrumtime.domain.release.Release
import org.scrumtime.domain.user.SystemUser

class Product implements Comparable{
    Date dateCreated
	Date lastUpdated

    String name
    String description
    static belongsTo = [organization: Organization]
    static hasMany = [releases: Release, owners : SystemUser]
    SortedSet releases
    String createdBy  // unique username

    static constraints = {
		name(unique:'organization',blank:false,nullable:false, size:1..80)
        description(blank:false, size:1..512)
        organization(nullable:false)
    }
    
    
    def int compareTo(obj) {
        def result = 0
        if (obj instanceof Product){
            def product = (Product)obj
            if (this.organization == product.organization)
                result = this.name.compareTo(product.name)
            else
                result = this.organization.compareTo(product.organization)
        }
        return result
    }


}
