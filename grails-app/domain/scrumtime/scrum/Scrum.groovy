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
package scrumtime.scrum

import scrumtime.sprint.Sprint

class Scrum  implements Comparable{
    Date dateCreated
	Date lastUpdated

    Date dateOfScrum
    static belongsTo = [sprint: Sprint]
    Sprint sprint

    static constraints = {
        dateOfScrum(nullable:false,  unique:'sprint')
        sprint(nullable:false)
    }

    def int compareTo(obj) {
        def result = 0
        if (obj && obj instanceof Scrum){
            def scrum = (Scrum)obj
            result = this.dateOfScrum.compareTo(scrum.dateOfScrum)
        }
        return result
    }
}
