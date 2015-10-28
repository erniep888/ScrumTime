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
package org.scrumtime.domain.backlog

import org.scrumtime.domain.product.Product
import org.scrumtime.domain.release.Release
import org.scrumtime.domain.sprint.Sprint
import org.scrumtime.domain.user.SystemUser
import org.scrumtime.domain.user.UserInformation

class BacklogItem implements Comparable{
    Date dateCreated
	Date lastUpdated

    String name
    String description
    Product assignedProduct
    Release assignedRelease
    Sprint assignedSprint
    int workRemaining  // in hours
    int workCompleted // in hours
    UserInformation assignedTo
    UserInformation estimatedBy 
    BacklogPriority productPriority   // 1 to 10 with 1 being highest priority

    static constraints = {
        assignedProduct(nullable:false)
        assignedRelease(nullable:true)
        assignedSprint(nullable:true)
        name(blank:false,nullable:false, size:1..80)
        description(nullable:true, size:0..512)
        assignedTo(nullable:true)
        productPriority(nullable:false)
        assignedTo(nullable:true)
        estimatedBy(nullable:true)
    }
    
    def int compareTo(obj) {
        def result = 0
        if (obj instanceof BacklogItem){
            def backlogItem = (BacklogItem)obj
            result = this.name.compareTo(backlogItem.name)
            if (result == 0){
                result = this.pritority.compareTo(backlogItem.priority)
            }
        }
        return result
    }

}
