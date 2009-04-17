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
package scrumtime.sprint

import scrumtime.release.Release
import scrumtime.scrum.Scrum

class Sprint implements Comparable{
    Date dateCreated
	Date lastUpdated

    String name
    String description
    Date expectedStartDate
    Date expectedCompletionDate
    Date actualStartDate
    Date actualCompletionDate
    Release release
    String createdBy  // unique user name

    static constraints = {
		name(nullable:false, size:1..80)
        description(size:0..512)
        release(nullable: true)
        expectedCompletionDate(nullable:true)
        expectedStartDate(nullable:false)
        actualCompletionDate(nullable:true)
        actualStartDate(nullable:true)
    }

    def int compareTo(obj) {
        def result = 0
        if (obj && obj instanceof Sprint){
            def sprint = (Sprint)obj
            if (this.actualCompletionDate && sprint.actualCompletionDate)
                result = this.actualCompletionDate.compareTo(sprint.actualCompletionDate)
            else if (this.expectedCompletionDate && sprint.expectedCompletionDate)
                result = this.expectedCompletionDate.compareTo(sprint.expectedCompletionDate)
            else if (this.actualStartDate && sprint.actualStartDate)
                result = this.actualStartDate.compareTo(sprint.actualStartDate)
            else if (this.expectedStartDate && sprint.expectedStartDate)
                result = this.expectedStartDate.compareTo(sprint.expectedStartDate)
            else if (this.name && sprint.name)
                result = this.name.compareTo(sprint.name)
        }
        return result
    }
}
