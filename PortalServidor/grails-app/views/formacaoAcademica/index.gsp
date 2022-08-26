
<%@ page import="portalservidor.FormacaoAcademica" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="" />
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

            <div id="list-cadastro" class="content scaffold-list" role="main">
                <div class="page-header">
                    <h3>Formação Acadêmica</h3>
                </div>

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

                <fieldset class="buttons">
                    <a class="btn btn-info" data-toggle="modal" href="#my-modal">
                        <i class=" icon-eye-open icon-white"></i>
                        <g:message code="default.button.create.label"/> Foramação Existente
                    </a></li>
                    <g:link class="btn btn-success" action="create">
                        <i class=" icon-plus icon-white"></i>
                        <g:message code="default.button.create.label"/> Adicionar nova Formação
                    </g:link>
                </fieldset>

                <br/>
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
                        <g:if test="${formacaoAcademicaInstance.idPessoa == principal.idPessoa}">
                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${formacaoAcademicaInstance.id}">${fieldValue(bean: formacaoAcademicaInstance, field: "nomeCurso")}</td> </g:link>
                                <td>${fieldValue(bean: formacaoAcademicaInstance, field: "nomeServidor")}</td>
                                <td>${fieldValue(bean: formacaoAcademicaInstance, field: "tipoCurso")}</td>
                                <td>${fieldValue(bean: formacaoAcademicaInstance, field: "tipoArquivo")}</td>
                                <td><g:link action="downloadFile" id="${formacaoAcademicaInstance.id}">${fieldValue(bean: formacaoAcademicaInstance, field: "nomeArquivo")}</g:link></td>


                            </tr>
                        </g:if>
                    </g:each>
                    </tbody>
                </table>

                <div class="pagination">
                    <g:paginate total="${formacaoAcademicaInstanceTotal}" />
                </div>

                <fieldset class="buttons">
                    <g:link class="btn btn-primary pull-right" controller="cadastrarRemocao" action="create">
                        <i class=" icon-plus icon-white"></i>
                        <g:message code="default.button.create.label"/> Concluir e Cadastrar Remoção Interna
                    </g:link>
                </fieldset>
            </div>

        </div>
    </div>
</div>
</body>
</html>
