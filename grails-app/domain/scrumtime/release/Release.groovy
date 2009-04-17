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
package scrumtime.release

import scrumtime.product.Product
import scrumtime.sprint.Sprint

class Release implements Comparable{
    Date dateCreated
	Date lastUpdated

    String name
    String description
    static belongsTo = [product: Product]
    Product product
    static hasMany = [sprints: Sprint]
    SortedSet sprints
    String createdBy   // unique username

    static transients = ['expectedStartDate','expectedCompletionDate','actualStartDate','actualCompletionDate']

    static constraints = {
		name(unique:'product',blank:false, nullable:false, size:1..80)
        description(blank:false,nullable:false, size:0..512)
        product(nullable: false)
        sprints(nullable:true)
    }

    static mapping = {
        table 'release_'         // release reserved word in sql
    }

    Date getExpectedStartDate(){}
    Date getExpectedCompletionDate(){}
    Date getActualStartDate(){}
    Date getActualCompletionDate(){}

    def int compareTo(obj) {
        def result = 0
        if (obj && obj instanceof Release){
            def release = (Release)obj
            if (this.actualCompletionDate && release.actualCompletionDate)
                result = this.actualCompletionDate.compareTo(release.actualCompletionDate)
            else if (this.expectedCompletionDate && release.expectedCompletionDate)
                result = this.expectedCompletionDate.compareTo(release.expectedCompletionDate)
            else if (this.actualStartDate && release.actualStartDate)
                result = this.actualStartDate.compareTo(release.actualStartDate)
            else if (this.expectedStartDate && release.expectedStartDate)
                result = this.expectedStartDate.compareTo(release.expectedStartDate)
            else if (this.name && release.name)
                result = this.name.compareTo(release.name)
        }
        return result
    }
}
