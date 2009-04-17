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
 * */
package scrumtime.user

class SystemUser implements Comparable {
    /** Username  */
    String username
    String retypedUsername
    /** is enabled  */
    boolean enabled

    static transients = ['retypedUsername']

    def String toString() {
        return username
    }


    def int compareTo(obj) {
        def result = 0
        if (obj instanceof SystemUser) {
            def systemUser = (SystemUser) obj
            result = this.username.compareTo(systemUser.username)
        }
        return result
    }

    static constraints = {
        username(blank: false, unique: true, email: true, length: 3..80)
        retypedUsername(blank: false, unique: true, email: true, length: 3..80)
        enabled()
    }
}
