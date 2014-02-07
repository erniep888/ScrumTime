package scrumtime

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class StoryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Story.list(params), model:[storyInstanceCount: Story.count()]
    }

    def show(Story storyInstance) {
        respond storyInstance
    }

    def create() {
        respond new Story(params)
    }

    def api(){
        render Story.list() as JSON
    }

    @Transactional
    def save(Story storyInstance) {
        if (storyInstance == null) {
            notFound()
            return
        }

        if (storyInstance.hasErrors()) {
            respond storyInstance.errors, view:'create'
            return
        }

        storyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'storyInstance.label', default: 'Story'), storyInstance.id])
                redirect storyInstance
            }
            '*' { respond storyInstance, [status: CREATED] }
        }
    }

    def edit(Story storyInstance) {
        respond storyInstance
    }

    @Transactional
    def update(Story storyInstance) {
        if (storyInstance == null) {
            notFound()
            return
        }

        if (storyInstance.hasErrors()) {
            respond storyInstance.errors, view:'edit'
            return
        }

        storyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Story.label', default: 'Story'), storyInstance.id])
                redirect storyInstance
            }
            '*'{ respond storyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Story storyInstance) {

        if (storyInstance == null) {
            notFound()
            return
        }

        storyInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Story.label', default: 'Story'), storyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'storyInstance.label', default: 'Story'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
