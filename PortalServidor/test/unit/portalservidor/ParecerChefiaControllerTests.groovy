package portalservidor

import grails.test.mixin.*

@TestFor(ParecerChefiaController)
@Mock(ParecerChefia)
class ParecerChefiaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/parecerChefia/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.parecerChefiaInstanceList.size() == 0
        assert model.parecerChefiaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.parecerChefiaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.parecerChefiaInstance != null
        assert view == '/parecerChefia/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/parecerChefia/show/1'
        assert controller.flash.message != null
        assert ParecerChefia.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerChefia/list'

        populateValidParams(params)
        def parecerChefia = new ParecerChefia(params)

        assert parecerChefia.save() != null

        params.id = parecerChefia.id

        def model = controller.show()

        assert model.parecerChefiaInstance == parecerChefia
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerChefia/list'

        populateValidParams(params)
        def parecerChefia = new ParecerChefia(params)

        assert parecerChefia.save() != null

        params.id = parecerChefia.id

        def model = controller.edit()

        assert model.parecerChefiaInstance == parecerChefia
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/parecerChefia/list'

        response.reset()

        populateValidParams(params)
        def parecerChefia = new ParecerChefia(params)

        assert parecerChefia.save() != null

        // test invalid parameters in update
        params.id = parecerChefia.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/parecerChefia/edit"
        assert model.parecerChefiaInstance != null

        parecerChefia.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/parecerChefia/show/$parecerChefia.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        parecerChefia.clearErrors()

        populateValidParams(params)
        params.id = parecerChefia.id
        params.version = -1
        controller.update()

        assert view == "/parecerChefia/edit"
        assert model.parecerChefiaInstance != null
        assert model.parecerChefiaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/parecerChefia/list'

        response.reset()

        populateValidParams(params)
        def parecerChefia = new ParecerChefia(params)

        assert parecerChefia.save() != null
        assert ParecerChefia.count() == 1

        params.id = parecerChefia.id

        controller.delete()

        assert ParecerChefia.count() == 0
        assert ParecerChefia.get(parecerChefia.id) == null
        assert response.redirectedUrl == '/parecerChefia/list'
    }
}
