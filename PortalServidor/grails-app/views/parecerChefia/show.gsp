
<%@ page import="portalservidor.ParecerChefia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parecerChefia.label', default: 'ParecerChefia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-parecerChefia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-parecerChefia" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list parecerChefia">
			
				<g:if test="${parecerChefiaInstance?.outroServidor}">
				<li class="fieldcontain">
					<span id="outroServidor-label" class="property-label"><g:message code="parecerChefia.outroServidor.label" default="Outro Servidor" /></span>
					
						<span class="property-value" aria-labelledby="outroServidor-label"><g:fieldValue bean="${parecerChefiaInstance}" field="outroServidor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parecerChefiaInstance?.parecerChefiaMediato}">
				<li class="fieldcontain">
					<span id="parecerChefiaMediato-label" class="property-label"><g:message code="parecerChefia.parecerChefiaMediato.label" default="Parecer Chefia Mediato" /></span>
					
						<span class="property-value" aria-labelledby="parecerChefiaMediato-label"><g:fieldValue bean="${parecerChefiaInstance}" field="parecerChefiaMediato"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parecerChefiaInstance?.emailChefiaMediato}">
				<li class="fieldcontain">
					<span id="emailChefiaMediato-label" class="property-label"><g:message code="parecerChefia.emailChefiaMediato.label" default="Email Chefia Mediato" /></span>
					
						<span class="property-value" aria-labelledby="emailChefiaMediato-label"><g:fieldValue bean="${parecerChefiaInstance}" field="emailChefiaMediato"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parecerChefiaInstance?.cadastrarRemocao}">
				<li class="fieldcontain">
					<span id="cadastrarRemocao-label" class="property-label"><g:message code="parecerChefia.cadastrarRemocao.label" default="Cadastrar Remocao" /></span>
					
						<span class="property-value" aria-labelledby="cadastrarRemocao-label"><g:link controller="cadastrarRemocao" action="show" id="${parecerChefiaInstance?.cadastrarRemocao?.id}">${parecerChefiaInstance?.cadastrarRemocao?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${parecerChefiaInstance?.emailReitoria}">
				<li class="fieldcontain">
					<span id="emailReitoria-label" class="property-label"><g:message code="parecerChefia.emailReitoria.label" default="Email Reitoria" /></span>
					
						<span class="property-value" aria-labelledby="emailReitoria-label"><g:fieldValue bean="${parecerChefiaInstance}" field="emailReitoria"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${parecerChefiaInstance?.id}" />
					<g:link class="edit" action="edit" id="${parecerChefiaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
