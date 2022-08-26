<%@ page import="portalservidor.ParecerDiretor" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: 'Cadastro de Remoção ')}" />

    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span3">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
        </div>
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
            <div class="well" role="navigation">
                <ul class="nav nav-list">
                    <li class="nav-header">Parecer Chefia Mediata</li>
                </ul>


                <ul class="nav nav-list">
                    <sec:ifLoggedIn>

                        <div  class="controls">  <g:link controller="logout">Sair do Sistema</g:link></div>

                    </sec:ifLoggedIn>
                </ul>
            </div>
        </div>




            <div class="span9">

                <div id="list-cadastro" class="content scaffold-list" role="main">
                    <fieldset class="buttons">
                        <a class="btn btn-info" data-toggle="modal" href="#my-modal">
                            <i class=" icon-eye-open icon-white"></i>
                            <g:message code="default.button.create.label"/> Listar Destino Servidor
                        </a></li>

                    </fieldset> <br><br>
                    <div id="my-modal" class="modal fade" style="display: none;">
                        <fieldset>
                            <div class="modal-header">
                                <a class="close" data-dismiss="modal">×</a>
                                <h3> Servidores e Unidades de Destino </h3>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <td><h5>Nome do Servidor</h5></td>
                                        <td><h5>Unidade de Destino - 1ª Opção</h5></td>
                                        <td><h5>Unidade de Destino - 2ª Opção</h5></td>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${cadastroRemocao}" var="pegar">
                                        <tr>

                                            <td >${pegar.nomeSubordinado}</td>
                                            <td>${pegar.primeiraOpcao}</td>
                                            <td >${pegar.segundaOpcao}</td>

                                        </tr>
                                    </g:each>
                                </table>
                            </div>
                        </fieldset>
                    </div>
            <div class="page-header">
                <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            </div>

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${parecerDiretorInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${parecerDiretorInstance}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form action="save" method="post"  enctype="multipart/form-data">
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset><br>

                <fieldset class="buttons">
                    <g:submitButton name="create" class="btn-primary" value="Enviar" />
                </fieldset>
            </g:form>
        </div>
       </div>
      </div>
   </div>
</body>
</html>



