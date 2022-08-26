package portalservidor

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

class CursoController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index(Integer max) {


        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)
        CadastroServidor buscarDados = new CadastroServidor()
        buscarDados.idContrato = buscarView.id
        def pegarIdContrato = ListeCursoCapacitacao.findById(buscarDados.idContrato)

        params.max = Math.min(max ?: 10, 100)
        [cursoInstanceList: Curso.list(params), cursoInstanceTotal: Curso.count(),pegarCurso:pegarIdContrato,principal: principal]
    }

    def list(Integer max) {

        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)
        CadastroServidor buscarDados = new CadastroServidor()
        buscarDados.idContrato = buscarView.id
        def pegarIdContrato = ListeCursoCapacitacao.findById(buscarDados.idContrato)

        params.max = Math.min(max ?: 10, 100)
        [cursoInstanceList: Curso.list(params), cursoInstanceTotal: Curso.count(),pegarCurso:pegarIdContrato, principal: principal]
    }

    def create() {
        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)
        Curso buscarCurso = new Curso()
        buscarCurso.nomeServidor = buscarView.nomeServidor
        buscarCurso.matriculaServidor = buscarView.matricula
        buscarCurso.idPessoa = buscarView.idPessoa

        [cursoInstance: new Curso(params),redirectView: buscarCurso]
    }
    def modal(){

        //listar curso
        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)
        CadastroServidor buscarDados = new CadastroServidor()
        buscarDados.idContrato = buscarView.id
        def pegarIdContrato = ListeCursoCapacitacao.findById(buscarDados.idContrato)
        if (pegarIdContrato == null){
            render view: 'modal', model:[mensagem: "Não existe curso Cadastrado"]

        }


        [pegarCurso:pegarIdContrato]
    }

    def save() {
        def cursoInstance = new Curso(params)
        uploadFileData(cursoInstance)
        if (!cursoInstance.save(flush: true)) {
            render(view: "create", model: [cursoInstance: cursoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.id])
        redirect(action: "show", id: cursoInstance.id)
    }

    def show(Long id) {

        def cursoInstance = Curso.get(id)
        print cursoInstance.nomeCurso

        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "index")
            return
        }

        [cursoInstance: cursoInstance]
    }

    def edit(Long id) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "index")
            return
        }

        [cursoInstance: cursoInstance]
    }

    def update(Long id, Long version) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "index")
            return
        }

        if (version != null) {
            if (cursoInstance.version > version) {
                cursoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'curso.label', default: 'Curso')] as Object[],
                          "Another user has updated this Curso while you were editing")
                render(view: "edit", model: [cursoInstance: cursoInstance])
                return
            }
        }

        cursoInstance.properties = params

        if (!cursoInstance.save(flush: true)) {
            render(view: "edit", model: [cursoInstance: cursoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.id])
        redirect(action: "show", id: cursoInstance.id)
    }

    def delete(Long id) {
        def cursoInstance = Curso.get(id)
        if (!cursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "index")
            return
        }

        try {
            cursoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), id])
            redirect(action: "index")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), id])
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
        def projeto = Curso.get(params.id)
        response.setHeader("Content-disposition", "attachment; filename=${projeto.nomeArquivo}")
        response.contentType = projeto.tipoArquivo
        response.outputStream << projeto.arqAssociado
    }
}
