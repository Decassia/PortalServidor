<%@ page import="portalservidor.CadastrarRemocao" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: 'Dados')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>

<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="brand" href="#">UFT</a>
            <div class="nav-collapse collapse">
                <p class="navbar-text pull-right">
                    <g:link controller="logout">Sair</g:link>
                </p>
                <ul class="nav">
                    <li class="disabled"><a href="#"><span class="badge badge-success">1</span> Dados Funcionais</a></li>
                    <li class="disabled"><a href="#"><span class="badge badge-success">2</span> Cursos de Capacitação</a></li>
                    <li class="disabled"><a href="#"><span class="badge badge-success">3</span> Formação Acadêmica</a></li>
                    <li class="active"><g:link controller="cadastrarRemocao"><span class="badge badge-info">4</span> Remoção Interna</g:link></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="span12">
            <div id="edit-cadastro" class="content scaffold-edit" role="main">
                <div class="page-header">
                    <h3><g:message code="default.edit.label" args="[entityName]" /></h3>
                </div>
                <g:if test="${flash.message}">
                    <bootstrap:alert class="alert alert-info">${flash.message}</bootstrap:alert>
                </g:if>
                <g:hasErrors bean="${cadastrarRemocaoInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${cadastrarRemocaoInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form method="post" >
                    <g:hiddenField name="id" value="${cadastrarRemocaoInstance?.id}" />
                    <g:hiddenField name="version" value="${cadastrarRemocaoInstance?.version}" />

                    <fieldset class="form">
                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'email', 'error')} ">
                            <label for="email">
                                <g:message code="cadastrarRemocao.email.label" default="Email do Chefe Imediato" />

                            </label>
                            <g:field type="email" name="email" value="${cadastrarRemocaoInstance?.email}"/>   Digite o Email, caso o campo esteja em branco!
                        </div>


                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'matriculaChefe', 'error')} required">
                            <label for="matriculaChefe">
                                <g:message code="cadastrarRemocao.matriculaChefe.label" default="Matricula Chefe Imediato" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:textField name="matriculaChefe" type="number" value="${cadastrarRemocaoInstance?.matriculaChefe}" required="" readonly="readonly"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nomeChefe', 'error')} ">
                            <label for="nomeChefe">
                                <g:message code="cadastrarRemocao.nomeChefe.label" default="Nome do Chefe Imediato" />

                            </label>
                            <g:textField name="nomeChefe" value="${cadastrarRemocaoInstance?.nomeChefe}" readonly="readonly"/>
                        </div>


                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'matriculaSubordinado', 'error')} required">
                            <label for="matriculaSubordinado">
                                <g:message code="cadastrarRemocao.matriculaSubordinado.label" default="Matricula do Servidor" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:textField name="matriculaSubordinado" type="number" value="${cadastrarRemocaoInstance?.matriculaSubordinado}" readonly="readonly" required=""/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'idContrato', 'error')} required">
                            <label for="idContrato">
                                <g:message code="cadastrarRemocao.matriculaSubordinado.label" default="Número do Contrato do Servidor" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:textField name="idContrato" type="number" value="${cadastrarRemocaoInstance?.idContrato}" required=""/>
                        </div>
                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nivel', 'error')} required">
                            <label for="nivel">
                                <g:message code="cadastrarRemocao.matriculaSubordinado.label" default="Nível" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:textField name="nivel" type="number" value="${cadastrarRemocaoInstance?.nivel}" readonly="readonly" required=""/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'dataExercicio', 'error')} required">
                            <label for="dataExercicio">
                                <g:message code="cadastroServidor.dataExercicio.label" default="Data que Entrou em Exercício" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:datePicker name="dataExercicio" precision="day"  value="${cadastrarRemocaoInstance?.dataExercicio}" readonly="readonly" />
                        </div>



                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nomeSubordinado', 'error')} ">
                            <label for="nomeSubordinado">
                                <g:message code="cadastrarRemocao.nomeSubordinado.label" default="Nome do Servidor" />

                            </label>
                            <g:textField name="nomeSubordinado" value="${cadastrarRemocaoInstance?.nomeSubordinado}" readonly="readonly"/>
                        </div>




                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nomeSubordinado', 'error')} ">
                            <label for="outros">
                                <g:message code="cadastrarRemocao.outros.label" default="Unidade de Lotação" />
                            </label>
                            <g:textField name="campus" value="${cadastrarRemocaoInstance?.campus}" readonly="readonly"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nomeSubordinado', 'error')} ">
                            <label for="outros">
                                <g:message code="cadastrarRemocao.outros.label" default="Cargo" />
                            </label>
                            <g:textField name="cargo" value="${cadastrarRemocaoInstance?.cargo}" readonly="readonly"/>
                        </div>





                        <h5> Escolha a Unidade de Destino</h5>
                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'primeiraOpcao', 'error')} ">
                            <label for="primeiraOpcao">
                                <g:message code="cadastrarRemocao.primeiraOpcao.label" default="Primeira Opção" />
                                <span class="required-indicator">*</span>
                            </label>

                            <select name="primeiraOpcao" onblur="removeNaSegunda(this.value)">
                                <option></option>
                                <g:each in="${pegaVaga}" var="pega">
                                    <option name="optionPrimeiraOpcao" value="${pega}">${pega}</option>
                                </g:each>
                            </select>
                        </div>





                        <div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'segundaOpcao', 'error')} ">
                            <label for="segundaOpcao">
                                <g:message code="cadastrarRemocao.segundaOpcao.label" default="Segunda Opção" />

                            </label>

                            <select name="segundaOpcao" onblur="removeNaPrimeira(this.value)">
                                <option></option>
                                <g:each in="${pegaVaga}" var="pega">
                                    <option name="optionSegundaOpcao" value="${pega}">${pega}</option>
                                </g:each>
                            </select>
                        </div>




                    </fieldset>
                    <fieldset class="buttons">
                        <button type="submit" class="btn btn-primary" name="_action_update"><i class="icon-pencil icon-white"></i> ${message(code: 'default.button.update.label', default: 'Update')}</button>
                    </fieldset>
                </g:form>
            </div>

            <g:javascript>
                function removeNaPrimeira(valor){
                    var elementosPrimOpcao = document.getElementsByName("optionPrimeiraOpcao");
                    for(i=0;i<elementosPrimOpcao.length;i++){
                        if(elementosPrimOpcao[i].value==valor) elementosPrimOpcao[i].style.display="none";
                        else elementosPrimOpcao[i].style.display="";
                    }
                }
                function removeNaSegunda(valor){
                    var elementosSegOpcao = document.getElementsByName("optionSegundaOpcao");
                    for(i=0;i<elementosSegOpcao.length;i++){
                        if(elementosSegOpcao[i].value==valor) elementosSegOpcao[i].style.display="none";
                        else elementosSegOpcao[i].style.display="";
                    }
                }


            </g:javascript>
        </div>
    </div>
</div>
</body>
</html>
