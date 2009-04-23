/**
 *  Copyright 2009   scrumtime.org
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
package scrumtime.product

import scrumtime.user.SystemUser
import scrumtime.release.Release
import scrumtime.sprint.Sprint

class Product implements Comparable{
    Date dateCreated
	Date lastUpdated

    String name
    String description
    String organization
    static hasMany = [sprints: Sprint,releases: Release, owners : SystemUser,chickens : SystemUser,pigs : SystemUser]
    SortedSet sprints
    SortedSet releases
    SortedSet owners
    SortedSet chickens
    SortedSet pigs
    SystemUser creator

    static constraints = {
		name(blank:false,nullable:false, size:1..256)
        description(blank:false, size:1..512)
        organization(nullable:true)
        sprints(nullable:true)
        releases(nullable:true)
        owners(nullable:true)
        chickens(nullable:true)
        pigs(nullable:true)
        creator(nullable:false)
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
