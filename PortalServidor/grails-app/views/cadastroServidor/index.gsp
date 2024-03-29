<%@ page import="portalservidor.CadastroServidor" %>
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
                    <li class="nav-header">Dados Funcionais do Servidor</li>


                    <li class="active">
                        <g:link class="create" action="create">
                            <i class="icon-plus icon-white"></i>
                            <h7>Confirmar Dados Funcionais</h7>
                        </g:link>
                    </li>

                    <li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>>
                        <a href="${createLink(uri: '/')}"><i class=" icon-home"></i>Principal</a>
                    </li>                    </ul>
            </div>
        </div>
        <div class="content">
            <div class="row">
                <div id="create-request" class="span9" role="main">
                    <g:hasErrors bean="${cadastroServidorInstance}">
                        <div class="alert alert-error alert-block">
                            <ul class="errors" role="alert">
                                <g:eachError bean="${cadastroServidorInstance}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                                </g:eachError>
                            </ul>
                        </div>
                    </g:hasErrors>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
