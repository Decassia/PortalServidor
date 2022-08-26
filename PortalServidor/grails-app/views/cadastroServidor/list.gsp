
<%@ page import="portalservidor.CadastroServidor" %>
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
                    <li class="nav-header">Dadaos Funcionais</li>

                    <li class="active">
                        <g:link class="create" action="create">
                            <i class="icon-plus icon-white"></i>
                            <h7>Confirmar Dados Funcionais</h7>
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
                    <div id="list-request" class="content scaffold-list" role="main">
                        <table class="table table-striped table-bordered">
                            <thead>
                            <tr>

                                    <g:sortableColumn property="nomeServidor" title="${message(code: 'cadastroServidor.nomeServidor.label', default: 'Nome Servidor')}" />

                                    <g:sortableColumn property="matricula" title="${message(code: 'cadastroServidor.matricula.label', default: 'Matricula')}" />

                                    <g:sortableColumn property="dataExercicio" title="${message(code: 'cadastroServidor.dataExercicio.label', default: 'Data Exercicio')}" />

                                    <g:sortableColumn property="regimeTrabalho" title="${message(code: 'cadastroServidor.regimeTrabalho.label', default: 'Regime Trabalho')}" />

                                    <g:sortableColumn property="cargoOcupa" title="${message(code: 'cadastroServidor.cargoOcupa.label', default: 'Cargo Ocupa')}" />

                                    <g:sortableColumn property="nivel" title="${message(code: 'cadastroServidor.nivel.label', default: 'Nivel')}" />

                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cadastroServidorInstanceList}" status="i" var="cadastroServidorInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${cadastroServidorInstance.id}">${fieldValue(bean: cadastroServidorInstance, field: "nomeServidor")}</g:link></td>

                            <td>${fieldValue(bean: cadastroServidorInstance, field: "matricula")}</td>

                            <td>${fieldValue(bean: cadastroServidorInstance, field: "dataExercicio")}</td>

                            <td>${fieldValue(bean: cadastroServidorInstance, field: "regimeTrabalho")}</td>

                            <td>${fieldValue(bean: cadastroServidorInstance, field: "cargoOcupa")}</td>

                            <td>${fieldValue(bean: cadastroServidorInstance, field: "nivel")}</td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </table>
            <div class="pagination">
                <g:paginate total="${cadastroServidorInstanceTotal  }" />
            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>