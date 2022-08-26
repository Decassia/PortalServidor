
<%@ page import="portalservidor.CadastrarRemocao" %>


<%@ page import="portalservidor.CadastrarRemocao" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: 'Cadastro de Remoção ')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
<div class="row-fluid">

    <div class="span3">
        <div class="well">
            <ul class="nav nav-list">
                <li class="nav-header">${entityName}</li>

                <li>
                    <g:link class="create" action="create">
                        <i class="icon-plus"></i>
                        <h7> Cadastrar Remoção</h7>
                    </g:link>
                </li>

                <li<%= request.forwardURI == "${createLink(uri: '/')}" ? ' class="active"' : '' %>>
                    <a href="${createLink(uri: '/')}"><i class=" icon-home"></i>Principal</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="span9">



        <div id="list-cadastro" class="content scaffold-list" role="main">
            <h1>Formação Acadêmica </h1>
            <fieldset class="buttons">
                <a class="btn btn-info" data-toggle="modal" href="#my-modal">
                    <i class=" icon-eye-open icon-white"></i>
                    <g:message code="default.button.create.label"/> Vagas
                </a></li>

            </fieldset> <br><br>
            <div id="my-modal" class="modal fade" style="display: none;">
                <fieldset>
                    <div class="modal-header">
                        <a class="close" data-dismiss="modal">×</a>
                        <h3> Clique aqui! </h3>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <td><h5>Cargo</h5></td>
                                <td><h5>Nível</h5></td>
                                <td><h5>Campus</h5></td>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${buscarVagas}" var="pegar">
                                <tr>
                                    <td id="listarcurso">${pegar.cargo}</td>
                                    <td id="listarnada">${pegar.nivel}</td>
                                    <td id="listarnad">${pegar.campus}</td>
                                </tr>
                            </g:each>
                        </table>
                    </div>
                </fieldset>
            </div>
            <table class="table table-striped">

                <table>
                    <thead>
                    <tr>

                        <g:sortableColumn property="nomeSubordinado" title="${message(code: 'cadastrarRemocao.nomeSubordinado.label', default: 'Nome do Servidor')}" />



                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cadastrarRemocaoInstanceList}" status="i" var="cadastrarRemocaoInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${cadastrarRemocaoInstance.id}">${fieldValue(bean: cadastrarRemocaoInstance, field: "nomeSubordinado")}</g:link></td>


                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </table>
            <div class="pagination">
                <g:paginate total="${cadastrarRemocaoInstanceTotal }" />
            </div>
        </div>
     </div>
    </div>
    </div>
    </div>
</body>
</html>
