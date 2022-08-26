<%@ page import="portalservidor.Curso" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: 'Curso ')}" />

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
                <h3><g:message code="default.edit.label" args="[entityName]" /></h3>
            </div>

            <div id="edit-cadastro" class="content scaffold-edit" role="main">

                <g:form action="save" method="post"  enctype="multipart/form-data">
                    <g:hiddenField name="id" value="${cursoInstance?.id}" />
                    <g:hiddenField name="version" value="${cursoInstance?.version}" />
                    <fieldset class="form">

                        <div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'nomeCurso', 'error')} ">
                            <label for="nomeCurso">
                                <g:message code="curso.nomeCurso.label" default="Nome Curso" />

                            </label>
                            <g:textField name="nomeCurso" value="${cursoInstance?.nomeCurso}"/>
                        </div>


                        <div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'dataInicial', 'error')} required">
                            <label for="dataInicial">
                                <g:message code="curso.dataInicial.label" default="Data Inicial" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:datePicker name="dataInicial" precision="day"  value="${cursoInstance?.dataInicial}"  />
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'dataFinal', 'error')} required">
                            <label for="dataFinal">
                                <g:message code="curso.dataFinal.label" default="Data Final" />
                                <span class="required-indicator">*</span>
                            </label>
                            <g:datePicker name="dataFinal" precision="day"  value="${cursoInstance?.dataFinal}"  />
                        </div>


                        <div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'cargaHoraria', 'error')} ">
                            <label for="cargaHoraria">
                                <g:message code="curso.cargaHoraria.label" default="Carga Horaria" />

                            </label>
                            <g:textField name="cargaHoraria" value="${cursoInstance?.cargaHoraria}"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'instituicaoRealizadora', 'error')} ">
                            <label for="instituicaoRealizadora">
                                <g:message code="curso.instituicaoRealizadora.label" default="Instituicao Realizadora" />

                            </label>
                            <g:textField name="instituicaoRealizadora" value="${cursoInstance?.instituicaoRealizadora}"/>
                        </div>

                        <div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'nomeServidor', 'error')} ">
                            <label for="nomeServidor">
                                <g:message code="curso.nomeServidor.label" default="Nome Servidor" />

                            </label>
                            <g:textField name="nomeServidor" value="${cursoInstance?.nomeServidor}"/>
                        </div>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="arqAssociado"><g:message code="projeto.arqAssociado.label" default="Anexar Certificado" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: cursoInstance, field: 'arqAssociado', 'errors')}">
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