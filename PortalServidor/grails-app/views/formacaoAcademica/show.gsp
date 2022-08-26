
<%@ page import="portalservidor.FormacaoAcademica" %>
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
                    <li class="disabled"><a href="#"><span class="badge badge-success">2</span> Cursos de Capacitação</a></li>
                    <li class="active"><g:link controller="formacaoAcademica"><span class="badge badge-info">3</span> Formação Acadêmica</g:link></li>
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

            <dl class="property-list formacaoAcademica">



                <g:if test="${formacaoAcademicaInstance?.nomeCurso}">
                    <dt class="fieldcontain">
                        <span id="nomeCurso-label" class="property-label"><g:message code="formacaoAcademica.nomeCurso.label" default="Nome do Curso :" /></span>

                    <dd><span class="property-value" aria-labelledby="nomeCurso-label"><g:fieldValue bean="${formacaoAcademicaInstance}" field="nomeCurso"/></span> </dd>

                    </dt>
                </g:if>

                <g:if test="${formacaoAcademicaInstance?.tipoCurso}">
                    <dt class="fieldcontain">
                        <span id="tipoCurso-label" class="property-label"><g:message code="formacaoAcademica.tipoCurso.label" default="Tipo da Formação :" /></span>

                    <dd><span class="property-value" aria-labelledby="tipoCurso-label"><g:fieldValue bean="${formacaoAcademicaInstance}" field="tipoCurso"/></span></dd>

                    </dt>
                </g:if>

                <g:if test="${formacaoAcademicaInstance?.cargaHoraria}">
                    <dt class="fieldcontain">
                        <span id="cargaHoraria-label" class="property-label"><g:message code="formacaoAcademica.cargaHoraria.label" default="Carga Horária :" /></span>

                    <dd><span class="property-value" aria-labelledby="cargaHoraria-label"><g:fieldValue bean="${formacaoAcademicaInstance}" field="cargaHoraria"/></span> </dd>

                    </dt>
                </g:if>

                <g:if test="${formacaoAcademicaInstance?.instituicaoRealizadora}">
                    <dt class="fieldcontain">
                        <span id="instituicaoRealizadora-label" class="property-label"><g:message code="formacaoAcademica.instituicaoRealizadora.label" default="Instituição Realizadora" /></span>

                    <dd><span class="property-value" aria-labelledby="instituicaoRealizadora-label"><g:fieldValue bean="${formacaoAcademicaInstance}" field="instituicaoRealizadora"/></span></dd>

                    </dt>
                </g:if>






            </dl>
            <g:form>
                <fieldset class="buttons">
                    <g:hiddenField name="id" value="${formacaoAcademicaInstance?.id}" />
                    <g:link class="btn btn-primary" action="edit" id="${formacaoAcademicaInstance?.id}">
                        <i class=" icon-edit icon-white"></i>
                        <g:message code="default.button.edit.label" default="Edit" />
                    </g:link>




                    <button class="btn btn-danger" type="submit" name="_action_delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                        <i class="icon-trash icon-white"></i>
                        <g:message code="default.button.delete.label" default="Delete" />
                    </button>

                    <g:link class="btn btn-primary pull-right" controller="formacaoAcademica" action="index">
                        <i class=" icon-ok icon-white"></i>
                        <g:message code="default.button.create.label"/> Confirmar
                    </g:link>
                </fieldset>
            </g:form>

        </div>
    </div>
</div>
</body>
</html>
