<%@ page import="portalservidor.CadastrarRemocao" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: 'Dados')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<nav class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <div class="nav-collapse">
                <ul class="nav">
                    <li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>><a href="${createLink(uri: '/')}">Principal</a></li>
                    <li><g:link controller="logout">Logout</g:link></li>
                    <li class="active"><g:link controller="cadastroServidor">Dados Funcionais</g:link></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<div class="container">
    <div class="row">
        <div class="span9">
            <g:if test="${flash.message}">
                <div class="alert alert-info" role="status"><strong>${flash.message}</strong></div>
            </g:if>
            <g:if test="${flash.success}">
                <div class="alert alert-success" role="status"><strong>${flash.success}</strong></div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="alert alert-error" role="status"><strong>${flash.error}</strong></div>
            </g:if>
            <g:if test="${flash.warning}">
                <div class="alert alert-warning" role="status"><strong>${flash.warning}</strong></div>
            </g:if>
        </div>
    </div>
    <div class="row">
        <div class="sidebar span3">
        </div>
        <div class="content">
            <div class="row">
                <div id="edit-request" class="span9" role="main">
                    <div class="page-header">
                        <h3><g:message code="default.edit.label" args="[entityName]" /></h3>
                    </div>
                    <g:hasErrors bean="${cadastroServidorInstance}">
                        <div class="alert alert-error alert-block">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${cadastroServidorInstance}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </div>
                    </g:hasErrors>
                    <g:form method="post" >
                        <g:hiddenField name="id" value="${cadastroServidorInstance?.id}" />
                        <g:hiddenField name="version" value="${cadastroServidorInstance?.version}" />




                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'nomeServidor', 'error')} ">
                            <label for="nomeServidor">
                                <g:message code="cadastroServidor.nomeServidor.label" default="Nome Servidor"  readonly="readonly"/>

                            </label>
                            <g:textField name="nomeServidor" maxlength="100" class="span3" placeholder="Nome do Servidor" value="${cadastroServidorInstance?.nomeServidor}" size="100" readonly="readonly"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'matricula', 'error')} ">
                            <label for="matricula">
                                <g:message code="cadastroServidor.matricula.label" default="Matrícula" />

                            </label>
                            <g:textField name="matricula" value="${cadastroServidorInstance?.matricula}" class="span2" placeholder="Matrícula" readonly="readonly"/>
                        </div>


                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'dataExercicio', 'error')} required">
                            <label for="dataExercicio">
                                <g:message code="cadastroServidor.dataExercicio.label" default="Data que Entrou em Exercício" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:datePicker name="dataExercicio" precision="day"  value="${cadastroServidorInstance?.dataExercicio}" readonly="readonly" />
                        </div>



                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'regimeTrabalho', 'error')} ">
                            <label for="regimeTrabalho">
                                <g:message code="cadastroServidor.regimeTrabalho.label" default="Regime de Trabalho" />

                            </label>
                            <g:textField name="regimeTrabalho" value="${cadastroServidorInstance?.regimeTrabalho}" class="span2" placeholder=".span2"  readonly="readonly"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'cargoOcupa', 'error')} ">
                            <label for="cargoOcupa">
                                <g:message code="cadastroServidor.cargoOcupa.label" default="Cargo que Ocupa" />

                            </label>
                            <g:textField name="cargoOcupa" value="${cadastroServidorInstance?.cargoOcupa}" class="span3" placeholder=".span3" readonly="readonly"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'nivel', 'error')} ">
                            <label for="nivel">
                                <g:message code="cadastroServidor.nivel.label" default="Nível" />

                            </label>
                            <g:textField name="nivel" value="${cadastroServidorInstance?.nivel}" class="span1" placeholder=".span1"  readonly="readonly"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'lotacaoExercicio', 'error')} ">
                            <label for="lotacaoExercicio">
                                <g:message code="cadastroServidor.lotacaoExercicio.label" default="Lotação em Exercicio" />

                            </label>
                            <g:textField name="lotacaoExercicio" value="${cadastroServidorInstance?.lotacaoExercicio}" class="span3" placeholder=".span3"  readonly="readonly"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'lotacaoOficial', 'error')} ">
                            <label for="lotacaoOficial">
                                <g:message code="cadastroServidor.lotacaoOficial.label" default="Lotação Oficial" />

                            </label>
                            <g:textField name="lotacaoOficial" value="${cadastroServidorInstance?.lotacaoOficial}" class="span2" placeholder=".span2"  readonly="readonly"/>
                        </div>


                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'emailPrincipal', 'error')} ">
                            <label for="emailPrincipal">

                                <g:message code="cadastroServidor.emailPrincipal.label" default="Email Principal" />

                            </label>

                            <g:textField name="emailPrincipal" value="${cadastroServidorInstance?.emailPrincipal}" class="span2" placeholder=".span2" readonly="readonly"/> @uft.edu.br


                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'emailSecundario', 'error')} ">
                            <label for="emailSecundario">
                                <g:message code="cadastroServidor.emailSecundario.label" default="Email Secundário" />

                            </label>

                            <g:textField name="emailSecundario" value="${cadastroServidorInstance?.emailSecundario}" class="span2" placeholder=".span2"    />
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'telefone', 'error')} required">
                            <label for="telefone">
                                <g:message code="cadastroServidor.telefone.label" default="Telefone" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:textField id="contato" name="telefone" required="" value="${cadastroServidorInstance?.telefone}" class="span2" placeholder="Telefone  "/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'escolaridade', 'error')} ">
                            <label for="escolaridade">
                                <g:message code="cadastroServidor.escolaridade.label" default="Escolaridade" />

                            </label>
                            <g:textField name="escolaridade" value="${cadastroServidorInstance?.escolaridade}"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'funcao', 'error')} required">
                            <label for="funcao">
                                <g:message code="cadastroServidor.funcao.label" default="Função que desempenha atualmente" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:textField name="funcao" required="" value="${cadastroServidorInstance?.funcao}" class="span3 " placeholder="Função" />
                        </div>


                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'descricaoAtividade', 'error')} required">
                            <label for="descricaoAtividade">
                                <g:message code="cadastroServidor.descricaoAtividade.label" default="Descrição das  Atividade que Desempenha A tualmente" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:textArea name="descricaoAtividade" cols="40" rows="5" maxlength="300" required="" value="${cadastroServidorInstance?.descricaoAtividade}"/>
                        </div>




                        <div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'outrosDados', 'error')} ">
                            <label for="outrosDados">
                                <g:message code="cadastroServidor.outrosDados.label" default="" />  Caso tenha algum dado errado, informe aqui nesse campo!

                            </label>
                            <g:textField name="outrosDados" value="${cadastroServidorInstance?.outrosDados}"/>
                        </div>





                        <fieldset class="buttons">
                            <button type="submit" class="btn btn-primary" name="_action_update"><i class="icon-pencil icon-white"></i> ${message(code: 'default.button.update.label', default: 'Update')}</button>

                            <button<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>>
                                <i class="icon-trash icon-white"></i>
                                <a href="${createLink(uri: '/')}"><i class=" icon-home"></i>Voltar</a>
                            </button>

                        </fieldset>
                    </g:form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
