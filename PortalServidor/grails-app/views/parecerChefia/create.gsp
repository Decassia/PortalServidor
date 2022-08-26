<%@ page import="portalservidor.ParecerChefia" %>

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
                    <li class="nav-header">Parecer Chefia Imediata</li>
                </ul>
                <ul class="nav nav-list">
                    <sec:ifLoggedIn>

                        <div  class="controls">  <g:link controller="logout">Sair do Sistema</g:link></div>

                    </sec:ifLoggedIn>
                </ul>
            </div>

        </div>

        <div class="span9">
            <div class="page-header">
                <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            </div>

            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${parecerChefiaInstance}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${parecerChefiaInstance}" var="error">
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
</body>
</html>
