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
package org.scrumtime.domain.organization

import org.scrumtime.domain.product.Product
import org.scrumtime.domain.user.SystemUser


class Organization implements Comparable {
    Date dateCreated
	Date lastUpdated

    String name
	String description
    static hasMany = [members : SystemUser, admins : SystemUser, products : Product]
    SortedSet members
    SortedSet admins
    SortedSet products
    String createdBy  // unique username

    static constraints = {
		name(blank:false, nullable:false,unique:true, size:1..80)
        description(blank:false, nullable:false, size:1..512)
    }
    
    def int compareTo(obj) {
        def result = 0
        if (obj instanceof Organization){
            def organization = (Organization)obj
            result = this.name.compareTo(organization.name)
        }
        return result
    }
}
