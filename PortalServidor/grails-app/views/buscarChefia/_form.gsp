<%@ page import="portalservidor.BuscarChefia" %>



<div class="fieldcontain ${hasErrors(bean: buscarChefiaInstance, field: 'matriculaChefe', 'error')} required">
	<label for="matriculaChefe">
		<g:message code="buscarChefia.matriculaChefe.label" default="Matricula Chefe" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="matriculaChefe" type="number" value="${buscarChefiaInstance.matriculaChefe}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: buscarChefiaInstance, field: 'matriculaSubordinado', 'error')} required">
	<label for="matriculaSubordinado">
		<g:message code="buscarChefia.matriculaSubordinado.label" default="Matricula Subordinado" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="matriculaSubordinado" type="number" value="${buscarChefiaInstance.matriculaSubordinado}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: buscarChefiaInstance, field: 'nomeChefe', 'error')} ">
	<label for="nomeChefe">
		<g:message code="buscarChefia.nomeChefe.label" default="Nome Chefe" />
		
	</label>
	<g:textField name="nomeChefe" value="${buscarChefiaInstance?.nomeChefe}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: buscarChefiaInstance, field: 'nomeSubordinado', 'error')} ">
	<label for="nomeSubordinado">
		<g:message code="buscarChefia.nomeSubordinado.label" default="Nome Subordinado" />
		
	</label>
	<g:textField name="nomeSubordinado" value="${buscarChefiaInstance?.nomeSubordinado}"/>
</div>

