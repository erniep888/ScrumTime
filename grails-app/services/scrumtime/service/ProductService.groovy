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
package scrumtime.service

import scrumtime.product.Product
import scrumtime.user.UserSettings

class ProductService {

    boolean transactional = true

    def deleteAndCleanUserSettings(Product product){
        if (product){
            def userSettings = UserSettings.findAllByCurrentProduct(product)
            for (userSetting in userSettings){
                userSetting.currentProduct = null
                userSetting.currentRelease = null
                userSetting.currentSprint = null
                userSetting.save(flush:true)
            }
            product.delete(flush:true)
        }
    }
}
