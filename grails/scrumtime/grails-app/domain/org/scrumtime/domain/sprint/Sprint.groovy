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
package org.scrumtime.domain.sprint

import org.scrumtime.domain.release.Release
import org.scrumtime.domain.scrum.Scrum

class Sprint implements Comparable{
    Date dateCreated
	Date lastUpdated

    String name
    String description
    Date expectedStartDate
    Date expectedCompletionDate
    Date actualStartDate
    Date actualCompletionDate
    String visibility
    static belongsTo = [release: Release]
    static hasMany = [scrums: Scrum]

    static constraints = {
		name(blank:false, unique:'release',nullable:false, size:1..80)
        description(blank:false, size:0..512)
        release(nullable: false)
        expectedCompletionDate(nullable:true)
        expectedStartDate(nullable:true)
        actualCompletionDate(nullable:true)
        actualStartDate(nullable:true)
        visibility(nullable:false, blank:false)
    }

    def int compareTo(obj) {
        def result = 0
        if (obj && obj instanceof Sprint){
            def sprint = (Sprint)obj
            if (this.release == sprint.release && expectedStartDate)
                result = this.expectedStartDate - sprint.expectedStartDate
            else
                result = this.release.compareTo(sprint.release)
        }
        return result
    }
}
