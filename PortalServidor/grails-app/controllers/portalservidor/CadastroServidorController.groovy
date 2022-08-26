package portalservidor

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import portal.login.*



class CadastroServidorController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "create")
    }



    def list(Integer max) {
        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def usuario = Usuario.findByIdPessoa(cadastroServidor.idPessoa)

        params.max = Math.min(max ?: 10, 100)
        [cadastroServidorInstanceList: CadastroServidor.list(params), cadastroServidorInstanceTotal: CadastroServidor.count()]
    }

    def create() {
        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)

        CadastroServidor buscarDados = new CadastroServidor()
        buscarDados.idContrato = buscarView.id
        buscarDados.nomeServidor = buscarView.nomeServidor
        buscarDados.matricula = buscarView.matricula
        buscarDados.dataExercicio = buscarView.dataExercicio
        buscarDados.lotacaoExercicio = buscarView.lotacaoExercicio
        buscarDados.regimeTrabalho = buscarView.regimeTrabalho
        buscarDados.lotacaoOficial = buscarView.lotacaoOficial
        buscarDados.cargoOcupa = buscarView.cargoOcupa
        buscarDados.nivel = buscarView.nivel
        buscarDados.escolaridade = buscarView.escolaridade
        buscarDados.emailSecundario = buscarView.emailSecundario
        buscarDados.emailPrincipal = principal.uid
        buscarDados.id = buscarView.id



        [redirectView:buscarDados, cadastroServidorInstance: new CadastroServidor(params)]
    }



    def save() {
        def cadastroServidorInstance = new CadastroServidor(params)
        if (!cadastroServidorInstance.save(flush: true)) {
            render(view: "show1", model: [cadastroServidorInstance: cadastroServidorInstance])
            //flash.message = 'O servidor Já tem Cadastro, Clique em Confirmar para prosseguir'
            return
        }


        flash.message = message(code: 'default.created.message', args: [message(code: 'cadastroServidor.label', default: 'CadastroServidor'), cadastroServidorInstance.id])
        redirect(action: "show", id: cadastroServidorInstance.id)
    }

    def show(Long id) {
        def cadastroServidorInstance = CadastroServidor.get(id)
        if (!cadastroServidorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadastroServidor.label', default: 'CadastroServidor'), id])
            redirect(action: "list")
            return
        }

        [cadastroServidorInstance: cadastroServidorInstance]
    }


    def edit(Long id) {
        def cadastroServidorInstance = CadastroServidor.get(id)
        if (!cadastroServidorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadastroServidor.label', default: 'CadastroServidor'), id])
            redirect(action: "list")
            return
        }

        [cadastroServidorInstance: cadastroServidorInstance]
    }

    def update(Long id, Long version) {
        def cadastroServidorInstance = CadastroServidor.get(id)
        if (!cadastroServidorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadastroServidor.label', default: 'CadastroServidor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cadastroServidorInstance.version > version) {
                cadastroServidorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cadastroServidor.label', default: 'CadastroServidor')] as Object[],
                          "Another user has updated this CadastroServidor while you were editing")
                render(view: "edit", model: [cadastroServidorInstance: cadastroServidorInstance])
                return
            }
        }

        cadastroServidorInstance.properties = params

        if (!cadastroServidorInstance.save(flush: true)) {
            render(view: "edit", model: [cadastroServidorInstance: cadastroServidorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cadastroServidor.label', default: 'CadastroServidor'), cadastroServidorInstance.id])
        redirect(action: "show", id: cadastroServidorInstance.id)
    }

    def delete(Long id) {
        def cadastroServidorInstance = CadastroServidor.get(id)
        if (!cadastroServidorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadastroServidor.label', default: 'CadastroServidor'), id])
            redirect(action: "list")
            return
        }

        try {
            cadastroServidorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cadastroServidor.label', default: 'CadastroServidor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cadastroServidor.label', default: 'CadastroServidor'), id])
            redirect(action: "show", id: id)
        }
    }
}
