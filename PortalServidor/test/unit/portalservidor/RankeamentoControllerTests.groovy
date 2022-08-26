package portalservidor



import org.junit.*
import grails.test.mixin.*

@TestFor(RankeamentoController)
@Mock(Rankeamento)
class RankeamentoControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/rankeamento/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.rankeamentoInstanceList.size() == 0
        assert model.rankeamentoInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.rankeamentoInstance != null
    }

    void testSave() {
        controller.save()

        assert model.rankeamentoInstance != null
        assert view == '/rankeamento/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/rankeamento/show/1'
        assert controller.flash.message != null
        assert Rankeamento.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/rankeamento/list'

        populateValidParams(params)
        def rankeamento = new Rankeamento(params)

        assert rankeamento.save() != null

        params.id = rankeamento.id

        def model = controller.show()

        assert model.rankeamentoInstance == rankeamento
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/rankeamento/list'

        populateValidParams(params)
        def rankeamento = new Rankeamento(params)

        assert rankeamento.save() != null

        params.id = rankeamento.id

        def model = controller.edit()

        assert model.rankeamentoInstance == rankeamento
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/rankeamento/list'

        response.reset()

        populateValidParams(params)
        def rankeamento = new Rankeamento(params)

        assert rankeamento.save() != null

        // test invalid parameters in update
        params.id = rankeamento.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/rankeamento/edit"
        assert model.rankeamentoInstance != null

        rankeamento.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/rankeamento/show/$rankeamento.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        rankeamento.clearErrors()

        populateValidParams(params)
        params.id = rankeamento.id
        params.version = -1
        controller.update()

        assert view == "/rankeamento/edit"
        assert model.rankeamentoInstance != null
        assert model.rankeamentoInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/rankeamento/list'

        response.reset()

        populateValidParams(params)
        def rankeamento = new Rankeamento(params)

        assert rankeamento.save() != null
        assert Rankeamento.count() == 1

        params.id = rankeamento.id

        controller.delete()

        assert Rankeamento.count() == 0
        assert Rankeamento.get(rankeamento.id) == null
        assert response.redirectedUrl == '/rankeamento/list'
    }
}
