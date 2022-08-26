package portalservidor

import grails.test.mixin.*

@TestFor(ParecerDiretorController)
@Mock(ParecerDiretor)
class ParecerDiretorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/parecerDiretor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.parecerDiretorInstanceList.size() == 0
        assert model.parecerDiretorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.parecerDiretorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.parecerDiretorInstance != null
        assert view == '/parecerDiretor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/parecerDiretor/show/1'
        assert controller.flash.message != null
        assert ParecerDiretor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerDiretor/list'

        populateValidParams(params)
        def parecerDiretor = new ParecerDiretor(params)

        assert parecerDiretor.save() != null

        params.id = parecerDiretor.id

        def model = controller.show()

        assert model.parecerDiretorInstance == parecerDiretor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerDiretor/list'

        populateValidParams(params)
        def parecerDiretor = new ParecerDiretor(params)

        assert parecerDiretor.save() != null

        params.id = parecerDiretor.id

        def model = controller.edit()

        assert model.parecerDiretorInstance == parecerDiretor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerDiretor/list'

        response.reset()

        populateValidParams(params)
        def parecerDiretor = new ParecerDiretor(params)

        assert parecerDiretor.save() != null

        // test invalid parameters in update
        params.id = parecerDiretor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/parecerDiretor/edit"
        assert model.parecerDiretorInstance != null

        parecerDiretor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/parecerDiretor/show/$parecerDiretor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        parecerDiretor.clearErrors()

        populateValidParams(params)
        params.id = parecerDiretor.id
        params.version = -1
        controller.update()

        assert view == "/parecerDiretor/edit"
        assert model.parecerDiretorInstance != null
        assert model.parecerDiretorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/parecerDiretor/list'

        response.reset()

        populateValidParams(params)
        def parecerDiretor = new ParecerDiretor(params)

        assert parecerDiretor.save() != null
        assert ParecerDiretor.count() == 1

        params.id = parecerDiretor.id

        controller.delete()

        assert ParecerDiretor.count() == 0
        assert ParecerDiretor.get(parecerDiretor.id) == null
        assert response.redirectedUrl == '/parecerDiretor/list'
    }
}
