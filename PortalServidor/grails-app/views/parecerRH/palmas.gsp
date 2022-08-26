<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="default.list.label" args="[entityName]" /></title>
    <ul class="nav nav-list">
        <sec:ifLoggedIn>

            <div  class="controls">  <g:link controller="logout">Sair do Sistema</g:link></div>

        </sec:ifLoggedIn>
    </ul>
</head>
<body>

<div id="palmas-parecerRH" class="content scaffold-list" role="main">
    <h1></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>

    <table class="table table-striped">
        <thead>
        <tr>
            <td><h5>Nome do Servidor</h5></td>
            <td><h5>Curso</h5></td>
            <td><h5>Parecer Chefia Mediata</h5></td>
            <td><h5>Parecer RH</h5></td>
            <td><h5>Unidade de Destino - 1ª Opção</h5></td>
            <td><h5>Unidade de Destino - 2ª Opção</h5></td>
            <td><h5>Unidade de  Origem</h5></td>
            <td><h5>Pontuação</h5></td>


        </tr>
        </thead>
        <tbody>
        <g:each in="${parecerRH}" var="pegar">
            <tr>
                <td>${pegar}</td>
                <td>${pegar.descricaoCurso}</td>


            </tr>
        </g:each>

    </table>
    <g:link class="btn btn-primary" action="create">Voltar</g:link>

</div>
</body>
</html>
