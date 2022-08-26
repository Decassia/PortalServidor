package portalservidor



import org.junit.*
import grails.test.mixin.*

@TestFor(CadastroServidorController)
@Mock(CadastroServidor)
class CadastroServidorControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cadastroServidor/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cadastroServidorInstanceList.size() == 0
        assert model.cadastroServidorInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cadastroServidorInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cadastroServidorInstance != null
        assert view == '/cadastroServidor/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cadastroServidor/show/1'
        assert controller.flash.message != null
        assert CadastroServidor.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cadastroServidor/list'

        populateValidParams(params)
        def cadastroServidor = new CadastroServidor(params)

        assert cadastroServidor.save() != null

        params.id = cadastroServidor.id

        def model = controller.show()

        assert model.cadastroServidorInstance == cadastroServidor
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cadastroServidor/list'

        populateValidParams(params)
        def cadastroServidor = new CadastroServidor(params)

        assert cadastroServidor.save() != null

        params.id = cadastroServidor.id

        def model = controller.edit()

        assert model.cadastroServidorInstance == cadastroServidor
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cadastroServidor/list'

        response.reset()

        populateValidParams(params)
        def cadastroServidor = new CadastroServidor(params)

        assert cadastroServidor.save() != null

        // test invalid parameters in update
        params.id = cadastroServidor.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cadastroServidor/edit"
        assert model.cadastroServidorInstance != null

        cadastroServidor.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cadastroServidor/show/$cadastroServidor.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cadastroServidor.clearErrors()

        populateValidParams(params)
        params.id = cadastroServidor.id
        params.version = -1
        controller.update()

        assert view == "/cadastroServidor/edit"
        assert model.cadastroServidorInstance != null
        assert model.cadastroServidorInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cadastroServidor/list'

        response.reset()

        populateValidParams(params)
        def cadastroServidor = new CadastroServidor(params)

        assert cadastroServidor.save() != null
        assert CadastroServidor.count() == 1

        params.id = cadastroServidor.id

        controller.delete()

        assert CadastroServidor.count() == 0
        assert CadastroServidor.get(cadastroServidor.id) == null
        assert response.redirectedUrl == '/cadastroServidor/list'
    }
}
