package portalservidor

import org.springframework.dao.DataIntegrityViolationException

class ParecerChefiaController {
    def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [parecerChefiaInstanceList: ParecerChefia.list(params), parecerChefiaInstanceTotal: ParecerChefia.count()]
    }

    def create() {

        [parecerChefiaInstance: new ParecerChefia(params)]
    }

    def save(Long id) {
        def parecerChefiaInstance = new ParecerChefia(params)
        def pegaUsuario = parecerChefiaInstance.getCadastrarRemocao()
        def nada = pegaUsuario.id
        print pegaUsuario.id

        if (!parecerChefiaInstance.hasErrors() && parecerChefiaInstance.save()) {

            if (parecerChefiaInstance.emailChefiaMediato) {
                    try {
                        sendMail {
                            to      "${parecerChefiaInstance.emailChefiaMediato}"
                            subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Imediato"
                            html      g.render(template:'/emailChefe/registrationConfirmation', model:[parecerChefiaInstance :nada ])
                        }
                        flash.message = "Confrimação de email enviado para ${parecerChefiaInstance.emailChefiaMediato}"
                        //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

                    } catch(Exception e) {
                        log.error "Problema ao enviar email $e.message", e
                        flash.message = "Email de confirmação não enviado!"
                    }

                    render(view: 'finalizar', model: [parecerChefiaInstance: parecerChefiaInstance])
                }
                if (parecerChefiaInstance.emailReitoria){

                    try {
                        sendMail {
                            to      "${parecerChefiaInstance.emailReitoria}"
                            subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Imediato"
                            html      g.render(template:'/emailChefe/registrationConfirmation', model:[parecerChefiaInstance : nada])
                        }
                        flash.message = "Confrimação de email enviado para ${parecerChefiaInstance.emailReitoria}"
                        //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

                    } catch(Exception e) {
                        log.error "Problema ao enviar email $e.message", e
                        flash.message = "Email de confirmação não enviado!"
                    }

                    render(view: 'finalizar', model: [parecerChefiaInstance: parecerChefiaInstance])
                }

        }


        else{
            render(view: 'create', model: [parecerChefiaInstance: parecerChefiaInstance])
        }

    }
        def show(Long id) {
        def parecerChefiaInstance = ParecerChefia.get(id)
        if (!parecerChefiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerChefia.label', default: 'ParecerChefia'), id])
            redirect(action: "list")
            return
        }

        [parecerChefiaInstance: parecerChefiaInstance]
    }

    def edit(Long id) {
        def parecerChefiaInstance = ParecerChefia.get(id)
        if (!parecerChefiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerChefia.label', default: 'ParecerChefia'), id])
            redirect(action: "list")
            return
        }

        [parecerChefiaInstance: parecerChefiaInstance]
    }

    def update(Long id, Long version) {
        def parecerChefiaInstance = ParecerChefia.get(id)
        if (!parecerChefiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerChefia.label', default: 'ParecerChefia'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (parecerChefiaInstance.version > version) {
                parecerChefiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'parecerChefia.label', default: 'ParecerChefia')] as Object[],
                        "Another user has updated this ParecerChefia while you were editing")
                render(view: "edit", model: [parecerChefiaInstance: parecerChefiaInstance])
                return
            }
        }

        parecerChefiaInstance.properties = params

        if (!parecerChefiaInstance.save(flush: true)) {
            render(view: "edit", model: [parecerChefiaInstance: parecerChefiaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'parecerChefia.label', default: 'ParecerChefia'), parecerChefiaInstance.id])
        redirect(action: "show", id: parecerChefiaInstance.id)
    }

    def delete(Long id) {
        def parecerChefiaInstance = ParecerChefia.get(id)
        if (!parecerChefiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerChefia.label', default: 'ParecerChefia'), id])
            redirect(action: "list")
            return
        }

        try {
            parecerChefiaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'parecerChefia.label', default: 'ParecerChefia'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'parecerChefia.label', default: 'ParecerChefia'), id])
            redirect(action: "show", id: id)
        }
    }

    def finalizar(){
        render(view:'finalizar')
    }
}
