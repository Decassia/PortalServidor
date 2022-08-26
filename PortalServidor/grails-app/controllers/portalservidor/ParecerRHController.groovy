package portalservidor

import org.springframework.dao.DataIntegrityViolationException

class ParecerRHController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [parecerRHInstanceList: ParecerRH.list(params), parecerRHInstanceTotal: ParecerRH.count()]
    }

  /*  def create() {

        def buscarDadosRelatorio = CadastrarRemocao.findAll()
        print buscarDadosRelatorio

        def parecerRH = CadastrarRemocao.get(params.id)
        def recebeIdRemocao = parecerRH.id
        print recebeIdRemocao

        [parecerRHInstance: new ParecerRH(params), parecerRH :recebeIdRemocao,buscarDadosRelatorio:buscarDadosRelatorio]
    }  */

    def save() {
        def parecerRHInstance = new ParecerRH(params)

        if (!parecerRHInstance.hasErrors() && parecerRHInstance.save()) {

            try {

                sendMail {
                    to      'decassia@uft.edu.br',"rhpalmas@uft.edu.br", "rhmiracema@uft.edu.br","rhportonacional@uft.edu.br",'rharaguaina@uft.edu.br','rhgurupi@uft.edu.br', 'rharraias@uft.edu.br' ,'rhtocantinopolis@uft.edu.br','rh@uft.edu.br'
                    subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Mediato"
                    html      g.render(template:'/emailRanking/registrationConfirmation', model:[parecerRHInstance: parecerRHInstance])
                }

                flash.message = "Confrimação de email enviado."
                //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

            } catch(Exception e) {
                log.error "Problema ao enviar email $e.message", e
                flash.message = "Email de confirmação não enviado!"
            }

            redirect(action: "finalizar")

        }

        else{
            render(view: 'create', model: [parecerRHInstance: parecerRHInstance])
        }
    }

    def segundaOpcao(){
        def parecerRh = ParecerRH.findAll(params.id)

        if (parecerRh == 'Inapto'){
            try {

                sendMail {
                    to      "decassia@uft.edu.br"
                    subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Mediato"
                    html      g.render(template:'/emailDireitor/registrationConfirmation', model:[parecerRHInstance:parecerRHInstance])
                }

                flash.message = "Confrimação de email enviado para decassia@uft.edu.br"
                //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

            } catch(Exception e) {
                log.error "Problema ao enviar email $e.message", e
                flash.message = "Email de confirmação não enviado!"
            }

            redirect(action: "finalizar", id: parecerRHInstance .id)

        }

    }

    def show(Long id) {
        def parecerRHInstance = ParecerRH.get(id)
        if (!parecerRHInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerRH.label', default: 'ParecerRH'), id])
            redirect(action: "list")
            return
        }

        [parecerRHInstance: parecerRHInstance]
    }

    def edit(Long id) {
        def parecerRHInstance = ParecerRH.get(id)
        if (!parecerRHInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerRH.label', default: 'ParecerRH'), id])
            redirect(action: "list")
            return
        }

        [parecerRHInstance: parecerRHInstance]
    }

    def update(Long id, Long version) {
        def parecerRHInstance = ParecerRH.get(id)
        if (!parecerRHInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerRH.label', default: 'ParecerRH'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (parecerRHInstance.version > version) {
                parecerRHInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'parecerRH.label', default: 'ParecerRH')] as Object[],
                          "Another user has updated this ParecerRH while you were editing")
                render(view: "edit", model: [parecerRHInstance: parecerRHInstance])
                return
            }
        }

        parecerRHInstance.properties = params

        if (!parecerRHInstance.save(flush: true)) {
            render(view: "edit", model: [parecerRHInstance: parecerRHInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'parecerRH.label', default: 'ParecerRH'), parecerRHInstance.id])
        redirect(action: "show", id: parecerRHInstance.id)
    }

    def delete(Long id) {
        def parecerRHInstance = ParecerRH.get(id)
        if (!parecerRHInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerRH.label', default: 'ParecerRH'), id])
            redirect(action: "list")
            return
        }

        try {
            parecerRHInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'parecerRH.label', default: 'ParecerRH'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'parecerRH.label', default: 'ParecerRH'), id])
            redirect(action: "show", id: id)
        }
    }


    def create() {

        def parecerRH = CadastrarRemocao.get(params.id)
        def recebeIdRemocao = parecerRH.id
        print parecerRH
        print recebeIdRemocao
        def  remocao =  CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Palmas")

        }
        def  remocaoAraguaina = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Araguaina")

        }
        def  remocaoPorto = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Porto Nacional")

        }

        def  remocaoArraias = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Arraias")

        }

        def  remocaoMiracema = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Miracema")

        }
        def  remocaoReitoria = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Reitoria")

        }
        def  remocaoGurupi = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Gurupi")

        }
        def  remocaoTocantinopolis = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Tocantinópolis")

        }














        [parecerRHInstance: new ParecerRH(params), parecerRH :recebeIdRemocao,remocao: remocao, remocaoAraguaina : remocaoAraguaina, remocaoArraias: remocaoArraias, remocaoTocantinopolis: remocaoTocantinopolis, remocaoReitoria: remocaoReitoria, remocaoGurupi : remocaoGurupi, remocaoMiracema:remocaoMiracema, remocaoPorto: remocaoPorto]
    }


    def finalizar(){
        render(view: "finalizar")
    }

}
