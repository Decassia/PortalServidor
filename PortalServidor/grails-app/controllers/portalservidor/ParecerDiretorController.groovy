package portalservidor

import org.springframework.dao.DataIntegrityViolationException

class ParecerDiretorController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "create", params: params)
    }

    def list(Integer max) {
        def cadastroRemocao = CadastrarRemocao.findAll()

        params.max = Math.min(max ?: 10, 100)
        [parecerDiretorInstanceList: ParecerDiretor.list(params), parecerDiretorInstanceTotal: ParecerDiretor.count()]
    }

    def create() {
        def cadastroRemocao = CadastrarRemocao.findAll()
         ///create?parecerChefia.cadastrarRemocao.id=18
        def parecerDiretor = CadastrarRemocao.get(params.id)
        def recebeIdRemocao = parecerDiretor.id
        print recebeIdRemocao
        print parecerDiretor
        [parecerDiretorInstance: new ParecerDiretor(params), parecerDiretor: recebeIdRemocao,cadastroRemocao :cadastroRemocao   ]
    }

    def save() {




        def parecerDiretorInstance = new ParecerDiretor(params)
        def pegaUsuario = parecerDiretorInstance.getCadastroRemocao()
        //def nada = pegaUsuario.id
        print pegaUsuario.id

        if (!parecerDiretorInstance.hasErrors() && parecerDiretorInstance.save()) {

               if (pegaUsuario.primeiraOpcao == 'Tocantinopolis'){
                   print pegaUsuario.primeiraOpcao
                try {
                  //, ','','','rhgurupi@uft.edu.br', '' ,'rhtocantinopolis@uft.edu.br','', 'decassia@uft.edu.br'
                    sendMail {
                        to      "rhtocantinopolis@uft.edu.br"
                        subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Mediato"
                        html      g.render(template:'/emailDireitor/registrationConfirmation', model:[parecerDiretorInstance : parecerDiretorInstance])
                    }

                    flash.message = "Confrimação de email enviado para rhportonacional@uft.edu.br"
                    //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

                } catch(Exception e) {
                    log.error "Problema ao enviar email $e.message", e
                    flash.message = "Email de confirmação não enviado!"
                }


               }
               if (pegaUsuario.primeiraOpcao == "Araguaina"){
                   print pegaUsuario.primeiraOpcao
                   print "print entrou aqui!"
                   try {

                       sendMail {
                           to      "rharaguaina@uft.edu.br"
                           subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Mediato"
                           html      g.render(template:'/emailDireitor/registrationConfirmation', model:[parecerDiretorInstance : parecerDiretorInstance])
                       }

                       flash.message = "Confrimação de email enviado para rharaguaina@uft.edu.br"
                       //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

                   } catch(Exception e) {
                       log.error "Problema ao enviar email $e.message", e
                       flash.message = "Email de confirmação não enviado!"
                   }


                }
                if (pegaUsuario.primeiraOpcao == 'Araguaina'){
                         print rhMiracema.primeiraOpcao
                         print "print entrou aqui Miracema!"
                         try {

                             sendMail {
                                 to      "rhmiracema@uft.edu.br'"
                                 subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Mediato"
                                 html      g.render(template:'/emailDireitor/registrationConfirmation', model:[parecerDiretorInstance : parecerDiretorInstance])
                             }

                             flash.message = "Confrimação de email enviado para rhmiracema@uft.edu.br"
                             //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

                         } catch(Exception e) {
                             log.error "Problema ao enviar email $e.message", e
                             flash.message = "Email de confirmação não enviado!"
                         }


                 }
                 if (pegaUsuario.primeiraOpcao == "Reitoria"){
                     print pegaUsuario.primeiraOpcao
                     print "print entrou aqui Reitoria!"
                     try {

                         sendMail {
                             to      "rh@uft.edu.br"
                             subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Mediato"
                             html      g.render(template:'/emailDireitor/registrationConfirmation', model:[parecerDiretorInstance : parecerDiretorInstance])
                         }

                         flash.message = "Confrimação de email enviado para rh@uft.edu.br"
                         //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

                     } catch(Exception e) {
                         log.error "Problema ao enviar email $e.message", e
                         flash.message = "Email de confirmação não enviado!"
                     }


                }


                if (pegaUsuario.primeiraOpcao == 'Palmas'){
                     print pegaUsuario.primeiraOpcao

                    try {

                        sendMail {
                            to      "rhpalmas@uft.edu.br"
                            subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Mediato"
                            html      g.render(template:'/emailDireitor/registrationConfirmation', model:[parecerDiretorInstance : parecerDiretorInstance])
                        }

                        flash.message = "Confrimação de email enviado para rhpalmas@uft.edu.br"
                        //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

                    } catch(Exception e) {
                        log.error "Problema ao enviar email $e.message", e
                        flash.message = "Email de confirmação não enviado!"
                    }


                }



                if (pegaUsuario.primeiraOpcao == "Porto Nacional"){

                    print pegaUsuario.primeiraOpcao
                    try {

                        sendMail {
                            to      "rhportonacional@uft.edu.br"
                            subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Mediato"
                            html      g.render(template:'/emailDireitor/registrationConfirmation', model:[parecerDiretorInstance : parecerDiretorInstance])
                        }

                        flash.message = "Confrimação de email enviado para rhtocantinopolis@uft.edu.br"
                        //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

                    } catch(Exception e) {
                        log.error "Problema ao enviar email $e.message", e
                        flash.message = "Email de confirmação não enviado!"
                    }


               }
               if (pegaUsuario.primeiraOpcao == "Gurupi"){

                    print pegaUsuario.primeiraOpcao
                    try {

                        sendMail {
                            to      "rhgurupi@uft.edu.br"
                            subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Mediato"
                            html      g.render(template:'/emailDireitor/registrationConfirmation', model:[parecerDiretorInstance : parecerDiretorInstance])
                        }

                        flash.message = "Confrimação de email enviado para rhtocantinopolis@uft.edu.br"
                        //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

                    } catch(Exception e) {
                        log.error "Problema ao enviar email $e.message", e
                        flash.message = "Email de confirmação não enviado!"
                    }


                }



               if (pegaUsuario.primeiraOpcao == "Arraias"){
                    print pegaUsuario.primeiraOpcao

                    try {

                        sendMail {
                            to      "rharraias@uft.edu.br"
                            subject  "Email de Parecer do Cadastro do Remoção interna do Chefe Mediato"
                            html      g.render(template:'/emailDireitor/registrationConfirmation', model:[parecerDiretorInstance : parecerDiretorInstance])
                        }

                        flash.message = "Confrimação de email enviado para rharraias@uft.edu.br"
                        //flash.message = "Confirmação de email enviado para ${cadHospedagemInstance.emailTecnico}"

                    } catch(Exception e) {
                        log.error "Problema ao enviar email $e.message", e
                        flash.message = "Email de confirmação não enviado!"
                    }


                }



            redirect(action: "finalizar", id: parecerDiretorInstance .id)

        } else{
        render(view: 'create', model: [parecerDiretorInstance: parecerDiretorInstance])
        }



}
    def show(Long id) {
        def parecerDiretorInstance = ParecerDiretor.get(id)
        if (!parecerDiretorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerDiretor.label', default: 'ParecerDiretor'), id])
            redirect(action: "list")
            return
        }

        [parecerDiretorInstance: parecerDiretorInstance]
    }

    def edit(Long id) {
        def parecerDiretorInstance = ParecerDiretor.get(id)
        if (!parecerDiretorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerDiretor.label', default: 'ParecerDiretor'), id])
            redirect(action: "list")
            return
        }

        [parecerDiretorInstance: parecerDiretorInstance]
    }

    def update(Long id, Long version) {
        def parecerDiretorInstance = ParecerDiretor.get(id)
        if (!parecerDiretorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerDiretor.label', default: 'ParecerDiretor'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (parecerDiretorInstance.version > version) {
                parecerDiretorInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'parecerDiretor.label', default: 'ParecerDiretor')] as Object[],
                        "Another user has updated this ParecerDiretor while you were editing")
                render(view: "edit", model: [parecerDiretorInstance: parecerDiretorInstance])
                return
            }
        }

        parecerDiretorInstance.properties = params

        if (!parecerDiretorInstance.save(flush: true)) {
            render(view: "edit", model: [parecerDiretorInstance: parecerDiretorInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'parecerDiretor.label', default: 'ParecerDiretor'), parecerDiretorInstance.id])
        redirect(action: "show", id: parecerDiretorInstance.id)
    }

    def delete(Long id) {
        def parecerDiretorInstance = portalservidor.ParecerDiretor.get(id)
        if (!parecerDiretorInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parecerDiretor.label', default: 'ParecerDiretor'), id])
            redirect(action: "list")
            return
        }

        try {
            parecerDiretorInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'parecerDiretor.label', default: 'ParecerDiretor'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'parecerDiretor.label', default: 'ParecerDiretor'), id])
            redirect(action: "show", id: id)
        }
    }

    def finalizar(){
        render(view: "finalizar")
    }

}