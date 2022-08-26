
<%@ page import="portalservidor.BuscarChefia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'buscarChefia.label', default: 'BuscarChefia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-buscarChefia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-buscarChefia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="matriculaChefe" title="${message(code: 'buscarChefia.matriculaChefe.label', default: 'Matricula Chefe')}" />
					
						<g:sortableColumn property="matriculaSubordinado" title="${message(code: 'buscarChefia.matriculaSubordinado.label', default: 'Matricula Subordinado')}" />
					
						<g:sortableColumn property="nomeChefe" title="${message(code: 'buscarChefia.nomeChefe.label', default: 'Nome Chefe')}" />
					
						<g:sortableColumn property="nomeSubordinado" title="${message(code: 'buscarChefia.nomeSubordinado.label', default: 'Nome Subordinado')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${buscarChefiaInstanceList}" status="i" var="buscarChefiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${buscarChefiaInstance.id}">${fieldValue(bean: buscarChefiaInstance, field: "matriculaChefe")}</g:link></td>
					
						<td>${fieldValue(bean: buscarChefiaInstance, field: "matriculaSubordinado")}</td>
					
						<td>${fieldValue(bean: buscarChefiaInstance, field: "nomeChefe")}</td>
					
						<td>${fieldValue(bean: buscarChefiaInstance, field: "nomeSubordinado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${buscarChefiaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
