<%@ page import="portalservidor.FormacaoAcademica" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: 'Formação')}" />

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
                <h3><g:message code="default.edit.label" args="[entityName]" /></h3>
            </div>

            <div id="edit-cadastro" class="content scaffold-edit" role="main">

                <g:form method="post"  enctype="multipart/form-data">
                    <g:hiddenField name="id" value="${formacaoAcademicaInstance?.id}" />
                    <g:hiddenField name="version" value="${formacaoAcademicaInstance?.version}" />
                    <fieldset class="form">
                        <div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'nomeCurso', 'error')} ">
                            <label for="nomeCurso">
                                <g:message code="formacaoAcademica.nomeCurso.label" default="Nome do Curso" />

                            </label>
                            <g:textField name="nomeCurso" value="${formacaoAcademicaInstance?.nomeCurso}" />
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'tipoCurso', 'error')} ">
                            <label for="tipoCurso">
                                <g:message code="formacaoAcademica.tipoCurso.label" default="Tipo de Formação" />

                            </label>
                            <g:select name="tipoCurso" from="${formacaoAcademicaInstance.constraints.tipoCurso.inList}" value="${formacaoAcademicaInstance?.tipoCurso}" valueMessagePrefix="formacaoAcademica.tipoCurso" noSelection="['': '']"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'cargaHoraria', 'error')} ">
                            <label for="cargaHoraria">
                                <g:message code="formacaoAcademica.cargaHoraria.label" default="Carga Horária" />

                            </label>
                            <g:textField name="cargaHoraria" value="${formacaoAcademicaInstance?.cargaHoraria}"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'instituicaoRealizadora', 'error')} ">
                            <label for="instituicaoRealizadora">
                                <g:message code="formacaoAcademica.instituicaoRealizadora.label" default="Instituição Realizadora" />

                            </label>
                            <g:textField name="instituicaoRealizadora" value="${formacaoAcademicaInstance?.instituicaoRealizadora}"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'nomeServidor', 'error')} ">
                            <label for="nomeServidor">
                                <g:message code="formacaoAcademica.nomeServidor.label" default="Nome do Servidor" />

                            </label>
                            <g:textField name="nomeServidor" value="${formacaoAcademicaInstance?.nomeServidor}" readonly="readonly"/>
                        </div>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="arqAssociado"><g:message code="formacaoAcademicaInstance.arqAssociado.label" default="Anexar Arquivo" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: formacaoAcademicaInstance, field: 'arqAssociado', 'errors')} required">
                                <input type="file" id="arqAssociado" name="arqAssociado" />
                            </td>
                        </tr>

                    </fieldset> <br><br>
                    <fieldset class="buttons">
                        <button type="submit" class="btn btn-primary" name="_action_update"><i class="icon-pencil icon-white"></i> ${message(code: 'default.button.update.label', default: 'Update')}</button>
                        <button type="submit" class="btn btn-danger" name="_action_delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"><i class="icon-trash icon-white"></i> ${message(code: 'default.button.delete.label', default: 'Delete')}</button>
                    </fieldset>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>