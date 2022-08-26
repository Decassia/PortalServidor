package portal.login

import grails.test.mixin.*

@TestFor(UsuarioRegraController)
@Mock(UsuarioRegra)
class UsuarioRegraControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/usuarioRegra/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.usuarioRegraInstanceList.size() == 0
        assert model.usuarioRegraInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.usuarioRegraInstance != null
    }

    void testSave() {
        controller.save()

        assert model.usuarioRegraInstance != null
        assert view == '/usuarioRegra/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/usuarioRegra/show/1'
        assert controller.flash.message != null
        assert UsuarioRegra.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/usuarioRegra/list'

        populateValidParams(params)
        def usuarioRegra = new UsuarioRegra(params)

        assert usuarioRegra.save() != null

        params.id = usuarioRegra.id

        def model = controller.show()

        assert model.usuarioRegraInstance == usuarioRegra
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/usuarioRegra/list'

        populateValidParams(params)
        def usuarioRegra = new UsuarioRegra(params)

        assert usuarioRegra.save() != null

        params.id = usuarioRegra.id

        def model = controller.edit()

        assert model.usuarioRegraInstance == usuarioRegra
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/usuarioRegra/list'

        response.reset()

        populateValidParams(params)
        def usuarioRegra = new UsuarioRegra(params)

        assert usuarioRegra.save() != null

        // test invalid parameters in update
        params.id = usuarioRegra.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/usuarioRegra/edit"
        assert model.usuarioRegraInstance != null

        usuarioRegra.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/usuarioRegra/show/$usuarioRegra.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        usuarioRegra.clearErrors()

        populateValidParams(params)
        params.id = usuarioRegra.id
        params.version = -1
        controller.update()

        assert view == "/usuarioRegra/edit"
        assert model.usuarioRegraInstance != null
        assert model.usuarioRegraInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/usuarioRegra/list'

        response.reset()

        populateValidParams(params)
        def usuarioRegra = new UsuarioRegra(params)

        assert usuarioRegra.save() != null
        assert UsuarioRegra.count() == 1

        params.id = usuarioRegra.id

        controller.delete()

        assert UsuarioRegra.count() == 0
        assert UsuarioRegra.get(usuarioRegra.id) == null
        assert response.redirectedUrl == '/usuarioRegra/list'
    }
}
