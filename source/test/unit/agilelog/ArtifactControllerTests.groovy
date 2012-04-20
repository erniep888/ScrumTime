package scrumtime



import org.junit.*
import grails.test.mixin.*

@TestFor(ArtifactController)
@Mock(Artifact)
class ArtifactControllerTests {


    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/artifact/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.artifactInstanceList.size() == 0
        assert model.artifactInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.artifactInstance != null
    }

    void testSave() {
        controller.save()

        assert model.artifactInstance != null
        assert view == '/artifact/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/artifact/show/1'
        assert controller.flash.message != null
        assert Artifact.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/artifact/list'


        populateValidParams(params)
        def artifact = new Artifact(params)

        assert artifact.save() != null

        params.id = artifact.id

        def model = controller.show()

        assert model.artifactInstance == artifact
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/artifact/list'


        populateValidParams(params)
        def artifact = new Artifact(params)

        assert artifact.save() != null

        params.id = artifact.id

        def model = controller.edit()

        assert model.artifactInstance == artifact
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/artifact/list'

        response.reset()


        populateValidParams(params)
        def artifact = new Artifact(params)

        assert artifact.save() != null

        // test invalid parameters in update
        params.id = artifact.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/artifact/edit"
        assert model.artifactInstance != null

        artifact.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/artifact/show/$artifact.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        artifact.clearErrors()

        populateValidParams(params)
        params.id = artifact.id
        params.version = -1
        controller.update()

        assert view == "/artifact/edit"
        assert model.artifactInstance != null
        assert model.artifactInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/artifact/list'

        response.reset()

        populateValidParams(params)
        def artifact = new Artifact(params)

        assert artifact.save() != null
        assert Artifact.count() == 1

        params.id = artifact.id

        controller.delete()

        assert Artifact.count() == 0
        assert Artifact.get(artifact.id) == null
        assert response.redirectedUrl == '/artifact/list'
    }
}
