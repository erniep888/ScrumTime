package org.scrumtime.web.controller.status

import org.scrumtime.domain.product.Product
import org.scrumtime.domain.release.Release
import org.scrumtime.domain.sprint.Sprint

class StatusController {

    def afterInterceptor = {model ->
        model.products = Product.findAll()
        model.releases = Release.findAll()
        model.sprints = Sprint.findAllByRelease(Release.get(1))
    }
    def index = {
        render(view: '/org/scrumtime/web/views/status/index',
               model:[breadCrumbTrail:'Status'])
    }
}
