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
package org.scrumtime.domain.release

import org.scrumtime.domain.product.Product
import org.scrumtime.domain.sprint.Sprint

class Release implements Comparable{
    Date dateCreated
	Date lastUpdated

    String name
    String description
    Date expectedStartDate
    Date expectedCompletionDate
    Date actualStartDate
    Date actualCompletionDate    
    static belongsTo = [product: Product]
    static hasMany = [sprints: Sprint]
    String createdBy   // unique username

    static constraints = {
		name(unique:'product',blank:false, nullable:false, size:1..80)
        description(blank:false,nullable:false, size:0..512)
        product(nullable: false)
        expectedCompletionDate(nullable:true)
        expectedStartDate(nullable:true)
        actualCompletionDate(nullable:true)
        actualStartDate(nullable:true)
    }

    static mapping = {
        table 'release_'         // release reserved word in sql
    }


    def int compareTo(obj) {
        def result = 0
        if (obj && obj instanceof Release){
            def release = (Release)obj
            if (this.product == release.product)
                result = this.completionOrder - release.completionOrder
            else
                result = this.product.compareTo(release.product)
        }
        return result
    }
}
