
<%@ page import="portalservidor.ParecerChefia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parecerChefia.label', default: 'ParecerChefia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-parecerChefia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-parecerChefia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="outroServidor" title="${message(code: 'parecerChefia.outroServidor.label', default: 'Outro Servidor')}" />
					
						<g:sortableColumn property="parecerChefiaMediato" title="${message(code: 'parecerChefia.parecerChefiaMediato.label', default: 'Parecer Chefia Mediato')}" />
					
						<g:sortableColumn property="emailChefiaMediato" title="${message(code: 'parecerChefia.emailChefiaMediato.label', default: 'Email Chefia Mediato')}" />
					
						<th><g:message code="parecerChefia.cadastrarRemocao.label" default="Cadastrar Remocao" /></th>
					
						<g:sortableColumn property="emailReitoria" title="${message(code: 'parecerChefia.emailReitoria.label', default: 'Email Reitoria')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${parecerChefiaInstanceList}" status="i" var="parecerChefiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${parecerChefiaInstance.id}">${fieldValue(bean: parecerChefiaInstance, field: "outroServidor")}</g:link></td>
					
						<td>${fieldValue(bean: parecerChefiaInstance, field: "parecerChefiaMediato")}</td>
					
						<td>${fieldValue(bean: parecerChefiaInstance, field: "emailChefiaMediato")}</td>
					
						<td>${fieldValue(bean: parecerChefiaInstance, field: "cadastrarRemocao")}</td>
					
						<td>${fieldValue(bean: parecerChefiaInstance, field: "emailReitoria")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${parecerChefiaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
