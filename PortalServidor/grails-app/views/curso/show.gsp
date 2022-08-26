
<%@ page import="portalservidor.Curso" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: 'Dados')}" />
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
                    <li class="active"><g:link controller="curso"><span class="badge badge-info">2</span> Cursos de Capacitação</g:link></li>
                    <li class="disabled"><a href="#"><span class="badge">3</span> Formação Acadêmica</a></li>
                    <li class="disabled"><a href="#"><span class="badge">4</span> Remoção Interna</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="span12">
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

            <div class="page-header">
                <h3><g:message code="default.show.label" args="[entityName]" /></h3>
            </div>

            <dl class="property-list curso">

                <g:if test="${cursoInstance?.cargaHoraria}">
                    <dd class="fieldcontain">
                    <dt><span id="cargaHoraria-label" class="property-label"><g:message code="curso.cargaHoraria.label" default="Carga Horária" /></span> </dt>

                    <span class="property-value" aria-labelledby="cargaHoraria-label"><g:fieldValue bean="${cursoInstance}" field="cargaHoraria"/></span>

                    </dd>
                </g:if>

                <g:if test="${cursoInstance?.instituicaoRealizadora}">
                    <dd class="fieldcontain">
                    <dt><span id="instituicaoRealizadora-label" class="property-label"><g:message code="curso.instituicaoRealizadora.label" default="Instituicao Realizadora" /></span></dt>

                    <span class="property-value" aria-labelledby="instituicaoRealizadora-label"><g:fieldValue bean="${cursoInstance}" field="instituicaoRealizadora"/></span>

                    </dd>
                </g:if>

                <g:if test="${cursoInstance?.nomeCurso}">
                    <dd class="fieldcontain">
                    <dt><span id="nomeCurso-label" class="property-label"><g:message code="curso.nomeCurso.label" default="Nome Curso" /></span> </dt>

                    <span class="property-value" aria-labelledby="nomeCurso-label"><g:fieldValue bean="${cursoInstance}" field="nomeCurso"/></span>

                    </dd>
                </g:if>

                <g:form>
                    <fieldset class="buttons">
                        <g:hiddenField name="id" value="${cursoInstance?.id}" />
                        <g:link class="btn btn-primary" action="edit" id="${cursoInstance?.id}">
                            <i class=" icon-edit icon-white"></i>
                            <g:message code="default.button.edit.label" default="Edit" />
                        </g:link>

                        <g:link class="btn btn-success" action="create">
                            <i class=" icon-plus icon-white"></i>
                            <g:message code="default.button.create.label"/> Novo Curso
                        </g:link>

                        <button class="btn btn-danger" type="submit" name="_action_delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                            <i class="icon-trash icon-white"></i>
                            <g:message code="default.button.delete.label" default="Delete" />
                        </button>


                        <g:link class="btn btn-primary pull-right" controller="curso" action="index">
                            <i class=" icon-ok icon-white"></i>
                            <g:message code="default.button.create.label"/> Confirmar
                        </g:link>

                    </fieldset>
                </g:form>
            </dl>
</body>
</html>

