package portalservidor



import org.junit.*
import grails.test.mixin.*

@TestFor(FormacaoAcademicaController)
@Mock(FormacaoAcademica)
class FormacaoAcademicaControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/formacaoAcademica/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.formacaoAcademicaInstanceList.size() == 0
        assert model.formacaoAcademicaInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.formacaoAcademicaInstance != null
    }

    void testSave() {
        controller.save()

        assert model.formacaoAcademicaInstance != null
        assert view == '/formacaoAcademica/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/formacaoAcademica/show/1'
        assert controller.flash.message != null
        assert FormacaoAcademica.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/formacaoAcademica/list'

        populateValidParams(params)
        def formacaoAcademica = new FormacaoAcademica(params)

        assert formacaoAcademica.save() != null

        params.id = formacaoAcademica.id

        def model = controller.show()

        assert model.formacaoAcademicaInstance == formacaoAcademica
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/formacaoAcademica/list'

        populateValidParams(params)
        def formacaoAcademica = new FormacaoAcademica(params)

        assert formacaoAcademica.save() != null

        params.id = formacaoAcademica.id

        def model = controller.edit()

        assert model.formacaoAcademicaInstance == formacaoAcademica
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/formacaoAcademica/list'

        response.reset()

        populateValidParams(params)
        def formacaoAcademica = new FormacaoAcademica(params)

        assert formacaoAcademica.save() != null

        // test invalid parameters in update
        params.id = formacaoAcademica.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/formacaoAcademica/edit"
        assert model.formacaoAcademicaInstance != null

        formacaoAcademica.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/formacaoAcademica/show/$formacaoAcademica.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        formacaoAcademica.clearErrors()

        populateValidParams(params)
        params.id = formacaoAcademica.id
        params.version = -1
        controller.update()

        assert view == "/formacaoAcademica/edit"
        assert model.formacaoAcademicaInstance != null
        assert model.formacaoAcademicaInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/formacaoAcademica/list'

        response.reset()

        populateValidParams(params)
        def formacaoAcademica = new FormacaoAcademica(params)

        assert formacaoAcademica.save() != null
        assert FormacaoAcademica.count() == 1

        params.id = formacaoAcademica.id

        controller.delete()

        assert FormacaoAcademica.count() == 0
        assert FormacaoAcademica.get(formacaoAcademica.id) == null
        assert response.redirectedUrl == '/formacaoAcademica/list'
    }
}
