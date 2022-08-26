
<%@ page import="portalservidor.Curso" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: '')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
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
                    <h3>Curso de Capacitação</h3>
                </div>

                <div id="my-modal" class="modal fade" style="display: none;">
                    <fieldset>
                        <div class="modal-header">
                            <a class="close" data-dismiss="modal">×</a>
                            <h3> Curso de Capacitação </h3>
                        </div>
                        <div class="modal-body">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <td><h5>Nome do Curso</h5></td>
                                    <td><h5>Carga Horária</h5></td>
                                    <td><h5>Dta Inicial</h5></td>
                                    <td><h5>Data Final</h5></td>
                                    <td><h5>Instituição Realizadora</h5></td>
                                    <td><h5>Número de Dias</h5></td>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${pegarCurso}" var="pegar">
                                    <tr>
                                        <td>${pegar.nomeCurso}</td>
                                        <td >${pegar.cargaHoraria}</td>
                                        <td>${pegar.dataInicio}</td>
                                        <td >${pegar.dataFim}</td>
                                        <td>${pegar.instituicao}</td>
                                        <td >${pegar.numDias}</td>
                                    </tr>
                                </g:each>
                            </table>
                        </div>
                    </fieldset>
                </div>

                <fieldset class="buttons">
                    <a class="btn btn-info" data-toggle="modal" href="#my-modal">
                        <i class=" icon-eye-open icon-white"></i>
                        <g:message code="default.button.create.label"/> Cursos Existentes
                    </a>
                    <g:link class="btn btn-success" action="create">
                        <i class=" icon-plus icon-white"></i>
                        <g:message code="default.button.create.label"/> Adicionar Curso
                    </g:link>
                </fieldset>

                <br/>
                <table class="table table-striped table-bordered">
                    <thead>
                    <tr>

                        <g:sortableColumn property="nomeCurso" title="${message(code: 'curso.nomeCurso.label', default: 'Nome Curso')}" />
                        <g:sortableColumn property="cargaHoraria" title="${message(code: 'curso.cargaHoraria.label', default: 'Carga Horaria')}" />
                        <g:sortableColumn property="instituicaoRealizadora" title="${message(code: 'curso.instituicaoRealizadora.label', default: 'Instituição Realizadora')}" />
                        <g:sortableColumn property="tipoArquivo" title="${message(code: 'projeto.tipoArquivo.label', default: 'Tipo do Arquivo')}" />
                        <g:sortableColumn property="nomeArquivo" title="${message(code: 'projeto.nomeArquivo.label', default: 'Nome do Arquivo - Download')}" />
                        <td>Editar</td>
                        <td>Excluir</td>

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cursoInstanceList}" status="i" var="cursoInstance">
                        <g:if test="${cursoInstance.idPessoa == principal.idPessoa}">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                <td><g:link action="show" id="${cursoInstance.id}">${fieldValue(bean: cursoInstance, field: "nomeCurso")}</g:link></td>
                                <td>${fieldValue(bean: cursoInstance, field: "cargaHoraria")}</td>
                                <td>${fieldValue(bean: cursoInstance, field: "instituicaoRealizadora")}</td>
                                <td>${fieldValue(bean: cursoInstance, field: "tipoArquivo")}</td>
                                <td><g:link action="downloadFile" id="${cursoInstance.id}">${fieldValue(bean: cursoInstance, field: "nomeArquivo")}</g:link></td>
                                <td>
                                    <g:link class="btn btn-primary" action="edit" id="${cursoInstance?.id}">
                                        <i class=" icon-edit icon-white"></i>
                                    </g:link>
                                </td>
                                <td>
                                    <button class="btn btn-danger" type="submit" name="_action_delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                                        <i class="icon-trash icon-white"></i>
                                    </button>
                                </td>
                            </tr>
                        </g:if>
                    </g:each>
                    </tbody>
                </table>
                <div class="pagination">
                    <g:paginate total="${cursoInstanceTotal}" />
                </div>

                <fieldset class="buttons">
                    <g:link class="btn btn-primary pull-right" controller="formacaoAcademica" action="index">
                        <g:message code="default.button.create.label"/> Concluir e Adicionar Formação Acadêmica >>
                    </g:link>
                </fieldset>
            </div>
        </div>
    </div>
</body>
</html>
