package portalservidor

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class FormacaoAcademicaController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index(Integer max) {
        //listar curso
        def principal = springSecurityService.principal
        print principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)
        CadastroServidor buscarDados = new CadastroServidor()
        buscarDados.idContrato = buscarView.id
        def pegarIdContrato = ListeCurso.findAllById(buscarDados.idContrato)
        params.max = Math.min(max ?: 10, 100)
        [formacaoAcademicaInstanceList: FormacaoAcademica.list(params), formacaoAcademicaInstanceTotal: FormacaoAcademica.count(),pegarCurso:pegarIdContrato,principal: principal]

    }

    def list(Integer max, Long id) {


        //listar curso
        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)
        CadastroServidor buscarDados = new CadastroServidor()
        buscarDados.idContrato = buscarView.id
        def pegarIdContrato = ListeCurso.findAllById(buscarDados.idContrato)





      //fim listar curso

        params.max = Math.min(max ?: 10, 100)
        [formacaoAcademicaInstanceList: FormacaoAcademica.list(params), formacaoAcademicaInstanceTotal: FormacaoAcademica.count(),pegarCurso:pegarIdContrato,principal: principal]

    }




    def create() {
        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)
        FormacaoAcademica formacaoAcademica = new FormacaoAcademica()
        formacaoAcademica.nomeServidor = buscarView.nomeServidor
        formacaoAcademica.matriculaServidor = buscarView.matricula
        formacaoAcademica.idPessoa = buscarView.idPessoa


        [formacaoAcademicaInstance: new FormacaoAcademica(params),redirectView: formacaoAcademica]
    }
    def modal(){

        //listar curso
        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)
        CadastroServidor buscarDados = new CadastroServidor()
        buscarDados.idContrato = buscarView.id
        def pegarIdContrato = ListeCurso.findAllById(buscarDados.idContrato)
        if (pegarIdContrato == null){

                render view: 'modal', model:[mensagem: "Não existe curso Cadastrado"]



        }

        [pegarCurso:pegarIdContrato]
    }

    def save() {
        def formacaoAcademicaInstance = new FormacaoAcademica(params)
        uploadFileData(formacaoAcademicaInstance)
        if (!formacaoAcademicaInstance.save(flush: true)) {
            render(view: "create", model: [formacaoAcademicaInstance: formacaoAcademicaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'formacaoAcademica.label', default: 'FormacaoAcademica'), formacaoAcademicaInstance.id])
        redirect(action: "show", id: formacaoAcademicaInstance.id)
    }

    def show(Long id) {
        def formacaoAcademicaInstance = FormacaoAcademica.get(id)
        print formacaoAcademicaInstance.matriculaServidor
        print formacaoAcademicaInstance.nomeServidor

        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)



        if (!formacaoAcademicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formacaoAcademica.label', default: 'FormacaoAcademica'), id])
            redirect(action: "index")
            return
        }
        if (buscarView.matricula == formacaoAcademicaInstance.matriculaServidor){
            print formacaoAcademicaInstance.nomeServidor
            print formacaoAcademicaInstance.matriculaServidor
        }

        [formacaoAcademicaInstance: formacaoAcademicaInstance]
    }

    def edit(Long id) {
        def formacaoAcademicaInstance = FormacaoAcademica.get(id)
        if (!formacaoAcademicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formacaoAcademica.label', default: 'FormacaoAcademica'), id])
            redirect(action: "show", id: formacaoAcademicaInstance.id)
            return
        }

        [formacaoAcademicaInstance: formacaoAcademicaInstance]
    }

    def update(Long id, Long version) {
        def formacaoAcademicaInstance = FormacaoAcademica.get(id)
        if (!formacaoAcademicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formacaoAcademica.label', default: 'FormacaoAcademica'), id])
            redirect(action: "index")
            return
        }

        if (version != null) {
            if (formacaoAcademicaInstance.version > version) {
                formacaoAcademicaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'formacaoAcademica.label', default: 'FormacaoAcademica')] as Object[],
                        "Another user has updated this FormacaoAcademica while you were editing")
                render(view: "edit", model: [formacaoAcademicaInstance: formacaoAcademicaInstance])
                return
            }
        }

        formacaoAcademicaInstance.properties = params

        if (!formacaoAcademicaInstance.save(flush: true)) {
            render(view: "edit", model: [formacaoAcademicaInstance: formacaoAcademicaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'formacaoAcademica.label', default: 'FormacaoAcademica'), formacaoAcademicaInstance.id])
        redirect(action: "show", id: formacaoAcademicaInstance.id)
    }

    def delete(Long id) {
        def formacaoAcademicaInstance = FormacaoAcademica.get(id)
        if (!formacaoAcademicaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'formacaoAcademica.label', default: 'FormacaoAcademica'), id])
            redirect(action: "index")
            return
        }

        try {
            formacaoAcademicaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'formacaoAcademica.label', default: 'FormacaoAcademica'), id])
            redirect(action: "index")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'formacaoAcademica.label', default: 'FormacaoAcademica'), id])
            redirect(action: "show", id: id)
        }
    }

        def uploadFileData = {
            projeto ->
            if (request instanceof MultipartHttpServletRequest) {
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;
                CommonsMultipartFile file = (CommonsMultipartFile)multiRequest.getFile("arqAssociado");
                projeto.nomeArquivo = file.originalFilename
                projeto.tipoArquivo = file.contentType
            }
        }

        def downloadFile = {
            def projeto = FormacaoAcademica.get(params.id)
            response.setHeader("Content-disposition", "attachment; filename=${projeto.nomeArquivo}")
            response.contentType = projeto.tipoArquivo
            response.outputStream << projeto.arqAssociado
        }

}
