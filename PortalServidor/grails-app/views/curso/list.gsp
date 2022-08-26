
<%@ page import="portalservidor.Curso" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: '')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span3">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
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
                    <li class="nav-header">Curso por Capacitação</li>


                    <li class="active">
                        <g:link class="create" action="create">
                            <i class="icon-plus icon-white"></i>
                            <h7>Cadastrar Curso</h7>
                        </g:link>
                    </li>

                    <li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>>
                        <a href="${createLink(uri: '/')}"><i class=" icon-home"></i>Principal</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="content">
            <div class="row">
                <div class="span9">
                    <div id="list-cadastro" class="content scaffold-list" role="main">
                        <h3>Curso Por Capacitação</h3>
                        <fieldset class="buttons">
                            <a class="btn btn-info" data-toggle="modal" href="#my-modal">
                                <i class=" icon-eye-open icon-white"></i>
                                <g:message code="default.button.create.label"/> Cursos Existentes
                            </a></li>
                            <g:link class="btn btn-success" action="create">
                                <i class=" icon-plus icon-white"></i>
                                <g:message code="default.button.create.label"/> Adicionar Curso
                            </g:link>
                        </fieldset> <br><br>
                        <div id="my-modal" class="modal fade" style="display: none;">
                            <fieldset>
                                <div class="modal-header">
                                    <a class="close" data-dismiss="modal">×</a>
                                    <h3> Curso por Capacitação </h3>
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


                     <table class="table table-striped table-bordered">
                            <thead>
                            <tr>

                        <g:sortableColumn property="nomeCurso" title="${message(code: 'curso.nomeCurso.label', default: 'Nome Curso')}" />
                        <g:sortableColumn property="cargaHoraria" title="${message(code: 'curso.cargaHoraria.label', default: 'Carga Horaria')}" />
                        <g:sortableColumn property="instituicaoRealizadora" title="${message(code: 'curso.instituicaoRealizadora.label', default: 'Instituição Realizadora')}" />
                        <g:sortableColumn property="tipoArquivo" title="${message(code: 'projeto.tipoArquivo.label', default: 'Tipo do Arquivo')}" />
                        <g:sortableColumn property="nomeArquivo" title="${message(code: 'projeto.nomeArquivo.label', default: 'Nome do Arquivo - Download')}" />
					
					</tr>
				</thead>
				<tbody>
                <g:each in="${cursoInstanceList}" status="i" var="cursoInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td><g:link action="show" id="${cursoInstance.id}">${fieldValue(bean: cursoInstance, field: "nomeCurso")}</g:link></td>
                        <td>${fieldValue(bean: cursoInstance, field: "cargaHoraria")}</td>
                        <td>${fieldValue(bean: cursoInstance, field: "instituicaoRealizadora")}</td>
                        <td>${fieldValue(bean: cursoInstance, field: "tipoArquivo")}</td>
                        <td><g:link action="downloadFile" id="${cursoInstance.id}">${fieldValue(bean: cursoInstance, field: "nomeArquivo")}</g:link></td>
                    </tr>
                </g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cursoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
