



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
    <div class="navbar">
        <div class="navbar-inner">

            <ul class="nav">
                <g:link class=" btn btn-inverse" action="araguaina">Campus de Araguaina</g:link>
                <g:link class=" btn btn-info" action="arraias"> Campus de Arraias</g:link>
                <g:link class="btn btn-primary" action="miracema">Campus de Miracema</g:link>
                <g:link class="btn btn-success" action="palmas">Campus de Palmas</g:link>
                <g:link class="btn " action="porto">Campus de Porto Nacional</g:link>
                <g:link class="btn btn-danger" action="tocantinopolis">Campus de Tocantinópolis</g:link>
                <g:link class="btn btn-warning" action="reitoria">Reitoria</g:link>
            </ul>
        </div>
    </div>



</html>

