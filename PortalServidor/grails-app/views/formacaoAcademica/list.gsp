
<%@ page import="portalservidor.FormacaoAcademica" %>
<!DOCTYPE html>
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
                    <li class="nav-header">Formação Acadêmica</li>


                    <li class="active">
                        <g:link class="create" action="create">
                            <i class="icon-plus icon-white"></i>
                            <h7>Cadastrar Formação Acadêmica</h7>
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
                        <h1>Formação Acadêmica </h1>
                        <fieldset class="buttons">
                            <a class="btn btn-info" data-toggle="modal" href="#my-modal">
                                <i class=" icon-eye-open icon-white"></i>
                                <g:message code="default.button.create.label"/> Foramação Existente
                            </a></li>
                            <g:link class="btn btn-success" action="create">
                                <i class=" icon-plus icon-white"></i>
                                <g:message code="default.button.create.label"/> Adicionar nova Formação
                            </g:link>
                        </fieldset> <br><br>
                        <div id="my-modal" class="modal fade" style="display: none;">
                            <fieldset>
                                <div class="modal-header">
                                    <a class="close" data-dismiss="modal">×</a>
                                    <h3> Formação Acadêmica </h3>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <td><h5>Formação</h5></td>
                                            <td><h5>Descrição da Formação</h5></td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${pegarCurso}" var="pegar">
                                            <tr>
                                                <td id="listarcurso">${pegar.descricaoCurso}</td>
                                                <td id="listarnada">${pegar.descricaoEspec}</td>
                                            </tr>
                                        </g:each>
                                    </table>
                                </div>
                            </fieldset>
                        </div>
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>


						<g:sortableColumn property="nomeCurso" title="${message(code: 'formacaoAcademica.nomeCurso.label', default: 'Nome Curso')}" />
                        <g:sortableColumn property="nomeServidor" title="${message(code: 'formacaoAcademica.nomeServidor.label', default: 'Nome Servidor')}" />
                        <g:sortableColumn property="tipoCurso" title="${message(code: 'formacaoAcademica.tipoCurso.label', default: 'Tipo de Formação')}" />
                        <g:sortableColumn property="tipoArquivo" title="${message(code: 'formacaoAcademica.tipoArquivo.label', default: 'Tipo do Arquivo')}" />

                        <g:sortableColumn property="nomeArquivo" title="${message(code: 'formacaoAcademica.nomeArquivo.label', default: 'Arquivo - Download')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${formacaoAcademicaInstanceList}" status="i" var="formacaoAcademicaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link action="show" id="${formacaoAcademicaInstance.id}">${fieldValue(bean: formacaoAcademicaInstance, field: "nomeCurso")}</td> </g:link>
                        <td>${fieldValue(bean: formacaoAcademicaInstance, field: "nomeServidor")}</td>
						<td>${fieldValue(bean: formacaoAcademicaInstance, field: "tipoCurso")}</td>
                        <td>${fieldValue(bean: formacaoAcademicaInstance, field: "tipoArquivo")}</td>
                        <td><g:link action="downloadFile" id="${formacaoAcademicaInstance.id}">${fieldValue(bean: formacaoAcademicaInstance, field: "nomeArquivo")}</g:link></td>


                    </tr>
				</g:each>
				</tbody>
			</table>

			<div class="pagination">
				<g:paginate total="${formacaoAcademicaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
