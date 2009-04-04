package scrumtime.status

import scrumtime.product.Product
import scrumtime.release.Release
import scrumtime.sprint.Sprint

class StatusController {

    def afterInterceptor = {model ->
        model.products = Product.findAll()
        model.releases = Release.findAll()
        model.sprints = Sprint.findAllByRelease(Release.get(1))
    }
    def index = {
        render(view: '/status/index',
               model:[breadCrumbTrail:'Status'])
    }
}
