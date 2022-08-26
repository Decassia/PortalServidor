
<%@ page import="portalservidor.BuscarChefia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'buscarChefia.label', default: 'BuscarChefia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-buscarChefia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-buscarChefia" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list buscarChefia">
			
				<g:if test="${buscarChefiaInstance?.matriculaChefe}">
				<li class="fieldcontain">
					<span id="matriculaChefe-label" class="property-label"><g:message code="buscarChefia.matriculaChefe.label" default="Matricula Chefe" /></span>
					
						<span class="property-value" aria-labelledby="matriculaChefe-label"><g:fieldValue bean="${buscarChefiaInstance}" field="matriculaChefe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buscarChefiaInstance?.matriculaSubordinado}">
				<li class="fieldcontain">
					<span id="matriculaSubordinado-label" class="property-label"><g:message code="buscarChefia.matriculaSubordinado.label" default="Matricula Subordinado" /></span>
					
						<span class="property-value" aria-labelledby="matriculaSubordinado-label"><g:fieldValue bean="${buscarChefiaInstance}" field="matriculaSubordinado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buscarChefiaInstance?.nomeChefe}">
				<li class="fieldcontain">
					<span id="nomeChefe-label" class="property-label"><g:message code="buscarChefia.nomeChefe.label" default="Nome Chefe" /></span>
					
						<span class="property-value" aria-labelledby="nomeChefe-label"><g:fieldValue bean="${buscarChefiaInstance}" field="nomeChefe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${buscarChefiaInstance?.nomeSubordinado}">
				<li class="fieldcontain">
					<span id="nomeSubordinado-label" class="property-label"><g:message code="buscarChefia.nomeSubordinado.label" default="Nome Subordinado" /></span>
					
						<span class="property-value" aria-labelledby="nomeSubordinado-label"><g:fieldValue bean="${buscarChefiaInstance}" field="nomeSubordinado"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${buscarChefiaInstance?.id}" />
					<g:link class="edit" action="edit" id="${buscarChefiaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
