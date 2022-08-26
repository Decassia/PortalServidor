package portalservidor

import grails.test.mixin.*

@TestFor(ParecerRHController)
@Mock(ParecerRH)
class ParecerRHControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/parecerRH/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.parecerRHInstanceList.size() == 0
        assert model.parecerRHInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.parecerRHInstance != null
    }

    void testSave() {
        controller.save()

        assert model.parecerRHInstance != null
        assert view == '/parecerRH/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/parecerRH/show/1'
        assert controller.flash.message != null
        assert ParecerRH.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerRH/list'

        populateValidParams(params)
        def parecerRH = new ParecerRH(params)

        assert parecerRH.save() != null

        params.id = parecerRH.id

        def model = controller.show()

        assert model.parecerRHInstance == parecerRH
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerRH/list'

        populateValidParams(params)
        def parecerRH = new ParecerRH(params)

        assert parecerRH.save() != null

        params.id = parecerRH.id

        def model = controller.edit()

        assert model.parecerRHInstance == parecerRH
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerRH/list'

        response.reset()

        populateValidParams(params)
        def parecerRH = new ParecerRH(params)

        assert parecerRH.save() != null

        // test invalid parameters in update
        params.id = parecerRH.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/parecerRH/edit"
        assert model.parecerRHInstance != null

        parecerRH.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/parecerRH/show/$parecerRH.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        parecerRH.clearErrors()

        populateValidParams(params)
        params.id = parecerRH.id
        params.version = -1
        controller.update()

        assert view == "/parecerRH/edit"
        assert model.parecerRHInstance != null
        assert model.parecerRHInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/parecerRH/list'

        response.reset()

        populateValidParams(params)
        def parecerRH = new ParecerRH(params)

        assert parecerRH.save() != null
        assert ParecerRH.count() == 1

        params.id = parecerRH.id

        controller.delete()

        assert ParecerRH.count() == 0
        assert ParecerRH.get(parecerRH.id) == null
        assert response.redirectedUrl == '/parecerRH/list'
    }
}
