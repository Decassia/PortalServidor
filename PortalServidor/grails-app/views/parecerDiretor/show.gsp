
<%@ page import="portalservidor.ParecerDiretor" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parecerDiretor.label', default: 'ParecerDiretor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-parecerDiretor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-parecerDiretor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list parecerDiretor">
			
				<g:if test="${parecerDiretorInstance?.parecerDiretor}">
				<li class="fieldcontain">
					<span id="parecerDiretor-label" class="property-label"><g:message code="parecerDiretor.parecerDiretor.label" default="Parecer Diretor" /></span>
					
						<span class="property-value" aria-labelledby="parecerDiretor-label"><g:fieldValue bean="${parecerDiretorInstance}" field="parecerDiretor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parecerDiretorInstance?.cadastroRemocao}">
				<li class="fieldcontain">
					<span id="cadastroRemocao-label" class="property-label"><g:message code="parecerDiretor.cadastroRemocao.label" default="Cadastro Remocao" /></span>
					
						<span class="property-value" aria-labelledby="cadastroRemocao-label"><g:link controller="cadastrarRemocao" action="show" id="${parecerDiretorInstance?.cadastroRemocao?.id}">${parecerDiretorInstance?.cadastroRemocao?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${parecerDiretorInstance?.id}" />
					<g:link class="edit" action="edit" id="${parecerDiretorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
