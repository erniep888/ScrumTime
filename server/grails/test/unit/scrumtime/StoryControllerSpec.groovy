package scrumtime



import grails.test.mixin.*
import spock.lang.*

@TestFor(StoryController)
@Mock(Story)
class StoryControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.storyInstanceList
            model.storyInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.storyInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def story = new Story()
            story.validate()
            controller.save(story)

        then:"The create view is rendered again with the correct model"
            model.storyInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            story = new Story(params)

            controller.save(story)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/story/show/1'
            controller.flash.message != null
            Story.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null scrumtime"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A scrumtime instance is passed to the show action"
            populateValidParams(params)
            def story = new Story(params)
            controller.show(story)

        then:"A model is populated containing the scrumtime instance"
            model.storyInstance == story
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null scrumtime"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A scrumtime instance is passed to the edit action"
            populateValidParams(params)
            def story = new Story(params)
            controller.edit(story)

        then:"A model is populated containing the scrumtime instance"
            model.storyInstance == story
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a scrumtime instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/story/index'
            flash.message != null


        when:"An invalid scrumtime instance is passed to the update action"
            response.reset()
            def story = new Story()
            story.validate()
            controller.update(story)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.storyInstance == story

        when:"A valid scrumtime instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            story = new Story(params).save(flush: true)
            controller.update(story)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/story/show/$story.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/story/index'
            flash.message != null

        when:"A scrumtime instance is created"
            response.reset()
            populateValidParams(params)
            def story = new Story(params).save(flush: true)

        then:"It exists"
            Story.count() == 1

        when:"The scrumtime instance is passed to the delete action"
            controller.delete(story)

        then:"The instance is deleted"
            Story.count() == 0
            response.redirectedUrl == '/story/index'
            flash.message != null
    }
}
