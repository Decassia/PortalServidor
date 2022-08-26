<%@ page import="portalservidor.CadastroServidor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'Cadastro de Remoção ')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
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
                <g:hasErrors bean="${cadastrarRemocaoInstance}">

                    <ul class="errors" role="alert">
                        <g:eachError bean="${cadastrarRemocaoInstance}" var="error">
                            <bootstrap:alert class="alert-error">
                                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                            </bootstrap:alert>
                        </g:eachError>
                    </ul>

                </g:hasErrors>

                <g:if test="${flash.message}">
                    <bootstrap:alert class="alert alert-info">${flash.message}</bootstrap:alert>
                </g:if>

                <div class="page-header">
                    <h3>Cadastrar Remoção Interna</h3>
                </div>

                <g:form action="save" >
                    <fieldset class="form">
                        <g:render template="form"/>
                        <fieldset class="buttons">
                            <g:submitButton  type="submit" class="btn btn-primary" name="create"  value="Salvar" /><!--tem alteração aq-->
                        </fieldset>
                    </fieldset>
                </g:form>
            </div>
        </div>
    </div>
    </body>
</html>
