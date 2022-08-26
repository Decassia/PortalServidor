
<%@ page import="portalservidor.ParecerRH" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parecerRH.label', default: 'ParecerRH')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-parecerRH" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-parecerRH" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list parecerRH">
			
				<g:if test="${parecerRHInstance?.parecerRH}">
				<li class="fieldcontain">
					<span id="parecerRH-label" class="property-label"><g:message code="parecerRH.parecerRH.label" default="Parecer RH" /></span>
					
						<span class="property-value" aria-labelledby="parecerRH-label"><g:fieldValue bean="${parecerRHInstance}" field="parecerRH"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parecerRHInstance?.cadastrarRemocao}">
				<li class="fieldcontain">
					<span id="cadastrarRemocao-label" class="property-label"><g:message code="parecerRH.cadastrarRemocao.label" default="Cadastrar Remocao" /></span>
					
						<span class="property-value" aria-labelledby="cadastrarRemocao-label"><g:link controller="cadastrarRemocao" action="show" id="${parecerRHInstance?.cadastrarRemocao?.id}">${parecerRHInstance?.cadastrarRemocao?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${parecerRHInstance?.id}" />
					<g:link class="edit" action="edit" id="${parecerRHInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
