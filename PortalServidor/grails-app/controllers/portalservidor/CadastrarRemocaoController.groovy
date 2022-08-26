package portalservidor

import org.springframework.dao.DataIntegrityViolationException

class CadastrarRemocaoController {

    def SpringSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index(Integer max) {
        def buscarVagas = BuscarVagas.findAll()
        //redirect(action: "index", params: params)
       [ buscarVagas: buscarVagas]
        redirect(action: "create")
    }


    def list(Integer max) {


        def buscarVagas = BuscarVagas.findAll()


        params.max = Math.min(max ?: 10, 100)
        [cadastrarRemocaoInstanceList: CadastrarRemocao.list(params), cadastrarRemocaoInstanceTotal: CadastrarRemocao.count(), buscarVagas: buscarVagas]
    }


    def create() {

        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)
        CadastroServidor buscarDados = new CadastroServidor()

        def buscarChefe = new CadastrarRemocao()
        //pega a matricula do subordinado
        buscarDados.matricula = buscarView.matricula
        buscarChefe.campus = buscarView.campus
        buscarChefe.cargo = buscarView.cargoOcupa
        buscarChefe.idContrato = buscarView.id
        buscarChefe.nivel = buscarView.nivel
        buscarChefe.dataExercicio = buscarView.dataExercicio
       // buscarChefe.descricaoCurso = buscarView.escolaridade

        def pegarChefia = BuscarChefia.findByMatriculaSubordinado(buscarDados.matricula)
        buscarChefe.matriculaChefe = pegarChefia.matriculaChefe
        buscarChefe.nomeChefe = pegarChefia.nomeChefe
        buscarChefe.matriculaSubordinado =  pegarChefia.matriculaSubordinado
        buscarChefe.nomeSubordinado = pegarChefia.nomeSubordinado

        if (pegarChefia == null){
            cadastrarRemocaoInstance: new CadastrarRemocao(params)
        }
        def buscarVagas = BuscarVagas.findAll()
        def pegaVaga = []
        def i = 0
        buscarVagas.each {busca ->
                if (busca.cargo == buscarChefe.cargo && busca.campus != buscarChefe.campus ) {
                    def buscaVaga = busca.campus
                   // print 'entrou aqui'
                    pegaVaga[i] = buscaVaga
                    i += 1

                }





        }

        if (pegaVaga.size() == 0){
           flash.message = 'Não há como efetuar o cadastro de Remoção pois não existe vaga pro seu cargo'

        }








               // buscarChefe.primeiraOpcao = busca.campus
               // print buscarChefe.primeiraOpcao






        //pega o email do chefe
        def pegaEmailChefe = BuscarServidor.findByMatricula(buscarChefe.matriculaChefe)


        buscarChefe.primeiraOpcao = pegaVaga
        buscarChefe.segundaOpcao = pegaVaga

        print buscarChefe.primeiraOpcao
        print buscarChefe.segundaOpcao

        buscarChefe.email = pegaEmailChefe.emailSecundario


             [cadastrarRemocaoInstance: new CadastrarRemocao(params), redirectChefe: buscarChefe, pegaVaga:pegaVaga]
    }

    def save() {
        def cadastrarRemocaoInstance = new CadastrarRemocao(params)
        if (!cadastrarRemocaoInstance.hasErrors() && cadastrarRemocaoInstance.save()) {

            try {
                sendMail {
                    to      "${cadastrarRemocaoInstance.email}"
                 //   cc    "${cadHospedagemInstance.emailTecnico}"
                    subject  "Email de Cadastro do Remoção interna"
                    html      g.render(template:'/email/registrationConfirmation', model:[cadastrarRemocaoInstance : cadastrarRemocaoInstance ])
                }
                flash.message = "Confrimação de email enviado para ${cadastrarRemocaoInstance.email}"
                //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

            } catch(Exception e) {
                log.error "Problema ao enviar email $e.message", e
                flash.message = "Email de confirmação não enviado!"
            }

            redirect(action: "show", id: cadastrarRemocaoInstance .id)
        }
        else{
            render(view: 'create', model: [cadastrarRemocaoInstance : cadastrarRemocaoInstance ])
        }




        // flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        // redirect(action: "show", id: userInstance.id)
    }

    def parecerDoChefe(){

        def result = CadastrarRemocao.findAll()

                [cadastrarRemocaoInstance: new CadastrarRemocao(params)]

    }

    def show(Long id, String url, String para) {
        def cadastrarRemocaoInstance = CadastrarRemocao.get(id)
        if (!cadastrarRemocaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadastrarRemocao.label', default: 'CadastrarRemocao'), id])
            redirect(action: "list")
            return
        }



        [cadastrarRemocaoInstance: cadastrarRemocaoInstance]
    }

    def edit(Long id) {
        def cadastrarRemocaoInstance = CadastrarRemocao.get(id)
        if (!cadastrarRemocaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadastrarRemocao.label', default: 'CadastrarRemocao'), id])
            redirect(action: "list")
            return
        }
        def principal = springSecurityService.principal
        CadastroServidor cadastroServidor = new CadastroServidor()
        cadastroServidor.idPessoa = principal.idPessoa
        def buscarView = BuscarServidor.findByIdPessoa(cadastroServidor.idPessoa)
        CadastroServidor buscarDados = new CadastroServidor()

        def buscarChefe = new CadastrarRemocao()
        //pega a matricula do subordinado
        buscarDados.matricula = buscarView.matricula
        buscarChefe.campus = buscarView.campus
        buscarChefe.cargo = buscarView.cargoOcupa
        buscarChefe.idContrato = buscarView.id
        buscarChefe.nivel = buscarView.nivel
        buscarChefe.dataExercicio = buscarView.dataExercicio
        // buscarChefe.descricaoCurso = buscarView.escolaridade

        def pegarChefia = BuscarChefia.findByMatriculaSubordinado(buscarDados.matricula)
        buscarChefe.matriculaChefe = pegarChefia.matriculaChefe
        buscarChefe.nomeChefe = pegarChefia.nomeChefe
        buscarChefe.matriculaSubordinado =  pegarChefia.matriculaSubordinado
        buscarChefe.nomeSubordinado = pegarChefia.nomeSubordinado

        if (pegarChefia == null){
            cadastrarRemocaoInstance: new CadastrarRemocao(params)
        }
        def buscarVagas = BuscarVagas.findAll()
        def pegaVaga = []
        def i = 0
        buscarVagas.each {busca ->
            if (busca.cargo == buscarChefe.cargo && busca.campus != buscarChefe.campus ) {
                def buscaVaga = busca.campus
                print 'entrou aqui'
                pegaVaga[i] = buscaVaga
                i += 1

            }





        }

        if (pegaVaga.size() == 0){
            flash.message = 'Não há como efetuar o cadastro de Remoção pois não existe vaga pro seu cargo'

        }






        buscarChefe.primeiraOpcao = pegaVaga
        buscarChefe.segundaOpcao = pegaVaga

        print buscarChefe.primeiraOpcao
        print buscarChefe.segundaOpcao







        [cadastrarRemocaoInstance: cadastrarRemocaoInstance,pegaVaga:pegaVaga,redirectChefe: buscarChefe]
    }


    def update(Long id, Long version) {
        def cadastrarRemocaoInstance = CadastrarRemocao.get(id)
        if (!cadastrarRemocaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadastrarRemocao.label', default: 'CadastrarRemocao'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cadastrarRemocaoInstance.version > version) {
                cadastrarRemocaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cadastrarRemocao.label', default: 'CadastrarRemocao')] as Object[],
                          "Another user has updated this CadastrarRemocao while you were editing")
                render(view: "edit", model: [cadastrarRemocaoInstance: cadastrarRemocaoInstance])
                return
            }
        }

        cadastrarRemocaoInstance.properties = params


        if (!cadastrarRemocaoInstance.hasErrors() && cadastrarRemocaoInstance.save()) {

            try {
                sendMail {
                    to      "${cadastrarRemocaoInstance.email}"
                    //   cc    "${cadHospedagemInstance.emailTecnico}"
                    subject  "Email de Cadastro do Remoção interna"
                    html      g.render(template:'/email/registrationConfirmation', model:[cadastrarRemocaoInstance : cadastrarRemocaoInstance ])
                }
                flash.message = "Confrimação de email enviado para ${cadastrarRemocaoInstance.email}"
                //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

            } catch(Exception e) {
                log.error "Problema ao enviar email $e.message", e
                flash.message = "Email de confirmação não enviado!"
            }

            redirect(action: "show", id: cadastrarRemocaoInstance .id)
        }
        else{
            render(view: 'create', model: [cadastrarRemocaoInstance : cadastrarRemocaoInstance ])
        }

      /*  if (!cadastrarRemocaoInstance.save(flush: true)) {
            render(view: "edit", model: [cadastrarRemocaoInstance: cadastrarRemocaoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cadastrarRemocao.label', default: 'CadastrarRemocao'), cadastrarRemocaoInstance.id])
        redirect(action: "show", id: cadastrarRemocaoInstance.id)         ***/
    }

    def delete(Long id) {
        def cadastrarRemocaoInstance = CadastrarRemocao.get(id)
        if (!cadastrarRemocaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cadastrarRemocao.label', default: 'CadastrarRemocao'), id])
            redirect(action: "list")
            return
        }

        try {
            cadastrarRemocaoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cadastrarRemocao.label', default: 'CadastrarRemocao'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cadastrarRemocao.label', default: 'CadastrarRemocao'), id])
            redirect(action: "show", id: id)
        }
    }

    def finalizar(){

    }

}
