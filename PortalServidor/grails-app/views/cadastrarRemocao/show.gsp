

<%@ page import="portalservidor.CadastrarRemocao" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: 'Cadastro')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
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
            <g:if test="${flash.message}">
                <bootstrap:alert  class="alert alert-info">${flash.message}</bootstrap:alert>
            </g:if>

            <div class="page-header">
                <h3>Visualiza cadastro de remoção</h3>
            </div>

            <dl class="property-list cadastrarRemocao">

                <g:if test="${cadastrarRemocaoInstance?.matriculaChefe}">
                    <dt class="fieldcontain">
                        <span id="matriculaChefe-label" class="property-label"><g:message code="cadastrarRemocao.matriculaChefe.label" default="Matricula Chefe : " /></span>

                    <dd> <span class="property-value" aria-labelledby="matriculaChefe-label"><g:fieldValue bean="${cadastrarRemocaoInstance}" field="matriculaChefe"/></span></dd>

                    </dt>

                </g:if>

                <g:if test="${cadastrarRemocaoInstance?.primeiraOpcao}">
                    <dt class="fieldcontain">
                        <span id="primeiraOpcao-label" class="property-label"><g:message code="cadastrarRemocao.primeiraOpcao.label" default="Primeira Opção  : " /></span>

                    <dd><span class="property-value" aria-labelledby="primeiraOpcao-label"><g:fieldValue bean="${cadastrarRemocaoInstance}" field="primeiraOpcao"/></span></dd>

                    </dt>
                </g:if>

                <g:if test="${cadastrarRemocaoInstance?.segundaOpcao}">
                    <dt class="fieldcontain">
                        <span id="segundaOpcao-label" class="property-label"><g:message code="cadastrarRemocao.segundaOpcao.label" default="Segunda Opção  : " /></span>

                    <dd><span class="property-value" aria-labelledby="segundaOpcao-label"><g:fieldValue bean="${cadastrarRemocaoInstance}" field="segundaOpcao"/></span></dd>

                    </dt>
                </g:if>

                <g:if test="${cadastrarRemocaoInstance?.email}">
                    <dt class="fieldcontain">
                        <span id="email-label" class="property-label"><g:message code="cadastrarRemocao.email.label" default="Email" /></span>

                    <dd><span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${cadastrarRemocaoInstance}" field="email"/></span></dd>

                    </dt>
                </g:if>

                <g:if test="${cadastrarRemocaoInstance?.matriculaSubordinado}">
                    <dt class="fieldcontain">
                        <span id="matriculaSubordinado-label" class="property-label"><g:message code="cadastrarRemocao.matriculaSubordinado.label" default="Matricula do Servidor : " /></span>

                    <dd><span class="property-value" aria-labelledby="matriculaSubordinado-label"><g:fieldValue bean="${cadastrarRemocaoInstance}" field="matriculaSubordinado"/></span></dd>

                    </dt>
                </g:if>

                <g:if test="${cadastrarRemocaoInstance?.nomeChefe}">
                    <dt class="fieldcontain">
                        <span id="nomeChefe-label" class="property-label"><g:message code="cadastrarRemocao.nomeChefe.label" default="Nome Chefe" /></span>

                    <dd> <span class="property-value" aria-labelledby="nomeChefe-label"><g:fieldValue bean="${cadastrarRemocaoInstance}" field="nomeChefe"/></span></dd>

                    </dt>
                </g:if>

                <g:if test="${cadastrarRemocaoInstance?.nomeSubordinado}">
                    <dt class="fieldcontain">
                        <span id="nomeSubordinado-label" class="property-label"><g:message code="cadastrarRemocao.nomeSubordinado.label" default="Nome do Servidor  : " /></span>

                    <dd><span class="property-value" aria-labelledby="nomeSubordinado-label"><g:fieldValue bean="${cadastrarRemocaoInstance}" field="nomeSubordinado"/></span></dd>

                    </dt>
                </g:if>

                <tr class="prop">
                    <dt><td valign="top" class="name"><g:message code="cadastrarRemocaoInstance.parecerChefia.label" default="Parecer Chefia Imediata" /></td></dt>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${cadastrarRemocaoInstance.parecerChefia}" var="l">
                                <li>${l?.encodeAsHTML()}</li>
                            </g:each>
                        </ul>
                    </td>

                </tr>



                <tr class="prop">
                    <dt><td valign="top" class="name"><g:message code="cadastrarRemocaoInstance.parecerChefia.label" default="Parecer Chefia Mediata" /></td></dt>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${cadastrarRemocaoInstance.parecerDiretor}" var="l">
                                <li>${l?.encodeAsHTML()}</li>
                            </g:each>
                        </ul>
                    </td>

                </tr>

                <tr class="prop">
                    <dt><td valign="top" class="name"><g:message code="cadastrarRemocaoInstance.parecerRH.label" default="Parecer do RH" /></td></dt>

                    <td valign="top" style="text-align: left;" class="value">
                        <ul>
                            <g:each in="${cadastrarRemocaoInstance.parecerRH}" var="l">
                                <li>${l?.encodeAsHTML()}</li>
                            </g:each>
                        </ul>
                    </td>

                </tr>





            </dl>
            <g:form>
                <!--tem alteração daqui...-->
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${cadastrarRemocaoInstance?.id}" />
                    <g:link class="btn btn-primary" action="edit" id="${cadastrarRemocaoInstance?.id}">
                        <i class=" icon-edit icon-white"></i>
                        <g:message code="default.button.edit.label" default="Edit" />
                    </g:link>
                    <g:link class="btn btn-primary" action="finalizar">
                        <i class=" icon-ok icon-white"></i>
                        Concluir
                    </g:link>
                </fieldset>
                <!--ateh aq-->
            </g:form>
        </div>
    </div>
</div>


<div class="row-fluid">
    <div class="span3">
    </div>

    <div class="span9">
        <div id="show-cadastro" class="content scaffold-show" role="main">
            <h1></h1>



        </div>
    </div>
</body>
</html>