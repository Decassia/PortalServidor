package portal.login

import grails.test.mixin.*

@TestFor(RegraController)
@Mock(Regra)
class RegraControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/regra/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.regraInstanceList.size() == 0
        assert model.regraInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.regraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.regraInstance != null
        assert view == '/regra/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/regra/show/1'
        assert controller.flash.message != null
        assert Regra.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/regra/list'

        populateValidParams(params)
        def regra = new Regra(params)

        assert regra.save() != null

        params.id = regra.id

        def model = controller.show()

        assert model.regraInstance == regra
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/regra/list'

        populateValidParams(params)
        def regra = new Regra(params)

        assert regra.save() != null

        params.id = regra.id

        def model = controller.edit()

        assert model.regraInstance == regra
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/regra/list'

        response.reset()

        populateValidParams(params)
        def regra = new Regra(params)

        assert regra.save() != null

        // test invalid parameters in update
        params.id = regra.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/regra/edit"
        assert model.regraInstance != null

        regra.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/regra/show/$regra.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        regra.clearErrors()

        populateValidParams(params)
        params.id = regra.id
        params.version = -1
        controller.update()

        assert view == "/regra/edit"
        assert model.regraInstance != null
        assert model.regraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/regra/list'

        response.reset()

        populateValidParams(params)
        def regra = new Regra(params)

        assert regra.save() != null
        assert Regra.count() == 1

        params.id = regra.id

        controller.delete()

        assert Regra.count() == 0
        assert Regra.get(regra.id) == null
        assert response.redirectedUrl == '/regra/list'
    }
}
