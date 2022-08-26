package portalservidor

import grails.test.mixin.*

@TestFor(CadastrarRemocaoController)
@Mock(CadastrarRemocao)
class CadastrarRemocaoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cadastrarRemocao/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cadastrarRemocaoInstanceList.size() == 0
        assert model.cadastrarRemocaoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cadastrarRemocaoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cadastrarRemocaoInstance != null
        assert view == '/cadastrarRemocao/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cadastrarRemocao/show/1'
        assert controller.flash.message != null
        assert CadastrarRemocao.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cadastrarRemocao/list'

        populateValidParams(params)
        def cadastrarRemocao = new CadastrarRemocao(params)

        assert cadastrarRemocao.save() != null

        params.id = cadastrarRemocao.id

        def model = controller.show()

        assert model.cadastrarRemocaoInstance == cadastrarRemocao
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cadastrarRemocao/list'

        populateValidParams(params)
        def cadastrarRemocao = new CadastrarRemocao(params)

        assert cadastrarRemocao.save() != null

        params.id = cadastrarRemocao.id

        def model = controller.edit()

        assert model.cadastrarRemocaoInstance == cadastrarRemocao
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cadastrarRemocao/list'

        response.reset()

        populateValidParams(params)
        def cadastrarRemocao = new CadastrarRemocao(params)

        assert cadastrarRemocao.save() != null

        // test invalid parameters in update
        params.id = cadastrarRemocao.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cadastrarRemocao/edit"
        assert model.cadastrarRemocaoInstance != null

        cadastrarRemocao.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cadastrarRemocao/show/$cadastrarRemocao.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cadastrarRemocao.clearErrors()

        populateValidParams(params)
        params.id = cadastrarRemocao.id
        params.version = -1
        controller.update()

        assert view == "/cadastrarRemocao/edit"
        assert model.cadastrarRemocaoInstance != null
        assert model.cadastrarRemocaoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cadastrarRemocao/list'

        response.reset()

        populateValidParams(params)
        def cadastrarRemocao = new CadastrarRemocao(params)

        assert cadastrarRemocao.save() != null
        assert CadastrarRemocao.count() == 1

        params.id = cadastrarRemocao.id

        controller.delete()

        assert CadastrarRemocao.count() == 0
        assert CadastrarRemocao.get(cadastrarRemocao.id) == null
        assert response.redirectedUrl == '/cadastrarRemocao/list'
    }
}
