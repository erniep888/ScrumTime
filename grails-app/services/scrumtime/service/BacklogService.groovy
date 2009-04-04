package scrumtime.service

import scrumtime.backlog.BacklogInformation
import scrumtime.backlog.BacklogItem
import scrumtime.user.SystemUser

class BacklogService {

    boolean transactional = true

    def deleteFromBacklog(def backlogItemId) {
        if (backlogItemId) {
            def backlogItem = BacklogItem.get(backlogItemId)
            backlogItem.delete()
        }
    }

    def findProductBacklog(def currentProduct, def backlogViewSettings) {
        def criteria = BacklogItem.createCriteria()
        def results = criteria.list {
            if (currentProduct)
                eq("assignedProduct", currentProduct)
            if (backlogViewSettings && backlogViewSettings.filterName)
                ilike("name", "%" + backlogViewSettings.filterName + "%")
            if (backlogViewSettings && backlogViewSettings.filterUserId) {
                def user = SystemUser.get(backlogViewSettings.filterUserId)
                if (user)
                    eq("assignedTo", user)
            }
            order('productPriority', 'asc')
        }
        return results
    }

    def findReleaseBacklog(def currentRelease, def backlogViewSettings) {
        def criteria = BacklogItem.createCriteria()
        def results = criteria.list {
            if (currentRelease)
                eq("assignedRelease", currentRelease)
            if (backlogViewSettings && backlogViewSettings.filterName)
                ilike("name", "%" + backlogViewSettings.filterName + "%")
            if (backlogViewSettings && backlogViewSettings.filterUserId) {
                def user = SystemUser.get(backlogViewSettings.filterUserId)
                if (user)
                    eq("assignedTo", user)
            }
            order('productPriority', 'asc')
        }
        return results
    }

    def findSprintBacklog(def currentSprint, def backlogViewSettings) {
        def criteria = BacklogItem.createCriteria()
        def results = criteria.list {
            if (currentSprint)
                eq("assignedSprint", currentSprint)
            if (backlogViewSettings && backlogViewSettings.filterName)
                ilike("name", "%" + backlogViewSettings.filterName + "%")
            if (backlogViewSettings && backlogViewSettings.filterUserId) {
                def user = SystemUser.get(backlogViewSettings.filterUserId)
                if (user)
                    eq("assignedTo", user)
            }
            order('productPriority', 'asc')
        }
        return results
    }

    def findProductBacklogInformation(def currentProduct) {
        BacklogInformation backlogInformation = new BacklogInformation()
        def value = BacklogItem.executeQuery('''select sum(bi.workRemaining),
                                sum(bi.workCompleted) from
                                scrumtime.backlog.BacklogItem bi where
                                bi.assignedProduct = :currentProduct''',
                [currentProduct: currentProduct])
        backlogInformation.workRemaining = (int) value[0][0] ? value[0][0] : 0
        backlogInformation.workCompleted = (int) value[0][1] ? value[0][1] : 0
        backlogInformation.totalWork = backlogInformation.workRemaining + backlogInformation.workCompleted
        backlogInformation.backlogName = currentProduct?.name
        return backlogInformation
    }

    def findReleaseBacklogInformation(def currentRelease) {
        BacklogInformation backlogInformation = new BacklogInformation()
        def value = BacklogItem.executeQuery('''select sum(bi.workRemaining),
                                    sum(bi.workCompleted) from
                                    scrumtime.backlog.BacklogItem bi where
                                    bi.assignedRelease = :currentRelease''',
                [currentRelease: currentRelease])
        backlogInformation.workRemaining = (int) value[0][0] ? value[0][0] : 0
        backlogInformation.workCompleted = (int) value[0][1] ? value[0][1] : 0
        backlogInformation.totalWork = backlogInformation.workRemaining + backlogInformation.workCompleted
        backlogInformation.backlogName = currentRelease?.name
        return backlogInformation
    }

    def findSprintBacklogInformation(def currentSprint) {
        BacklogInformation backlogInformation = new BacklogInformation()
        def value = BacklogItem.executeQuery('''select sum(bi.workRemaining),
                                    sum(bi.workCompleted) from
                                    scrumtime.backlog.BacklogItem bi where
                                    bi.assignedSprint = :currentSprint''',
                [currentSprint: currentSprint])
        backlogInformation.workRemaining = (int) value[0][0] ? value[0][0] : 0
        backlogInformation.workCompleted = (int) value[0][1] ? value[0][1] : 0
        backlogInformation.totalWork = backlogInformation.workRemaining + backlogInformation.workCompleted
        backlogInformation.backlogName = currentSprint?.name
        return backlogInformation
    }

    def addToProductBacklog(def backlogItemId, def currentProduct) {
        def backlogItem = BacklogItem.get(backlogItemId)
        if (backlogItem && currentProduct) {
            backlogItem.assignedProduct = currentProduct
            backlogItem.assignedRelease = null
            backlogItem.assignedSprint = null
            backlogItem.save(flush: true)
        }
    }

    def addToReleaseBacklog(def backlogItemId, def currentRelease) {
        def backlogItem = BacklogItem.get(backlogItemId)
        if (backlogItem && currentRelease && currentRelease.product) {
            backlogItem.assignedProduct = currentRelease.product
            backlogItem.assignedRelease = currentRelease
            backlogItem.assignedSprint = null
            backlogItem.save(flush: true)
        }
    }

    def addToSprintBacklog(def backlogItemId, def currentSprint) {
        def backlogItem = BacklogItem.get(backlogItemId)
        if (backlogItem && currentSprint && currentSprint.release &&
                currentSprint.release.product) {
            backlogItem.assignedProduct = currentSprint.release.product
            backlogItem.assignedRelease = currentSprint.release
            backlogItem.assignedSprint = currentSprint
            backlogItem.save(flush: true)
        }
    }

}
