<%@ page import="portalservidor.Curso" %>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'cadastrarRemocao', 'error')} required">
    <label for="nomeServidor">
        <g:message code="curso.cadastrarRemocao.label" default="Nome do Servidor" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nomeServidor" value="${redirectView?.nomeServidor}"></g:textField>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'cadastrarRemocao', 'error')} required">
    <label for="idPessoa">
        <g:message code="curso.cadastrarRemocao.label" default="Id do Servidor" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="idPessoa" value="${redirectView?.idPessoa}"></g:textField>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'cadastrarRemocao', 'error')} required">
    <label for="matriculaServidor">
        <g:message code="curso.cadastrarRemocao.label" default="Matricula do Servidor" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="matriculaServidor" value="${redirectView?.matriculaServidor}"></g:textField>
</div>





<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'nomeCurso', 'error')} ">
	<label for="nomeCurso">
		<g:message code="curso.nomeCurso.label" default="Nome do Curso" />

	</label>
	<g:textField name="nomeCurso" value="${cursoInstance?.nomeCurso}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'dataInicial', 'error')} required">
	<label for="dataInicial">
		<g:message code="curso.dataInicial.label" default="Data Inicial" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dataInicial" precision="day"  value="${cursoInstance?.dataInicial}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'dataFinal', 'error')} required">
    <label for="dataFinal">
        <g:message code="curso.dataFinal.label" default="Data Final" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dataFinal" precision="day"  value="${cursoInstance?.dataFinal}"  />
</div>


<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'cargaHoraria', 'error')} ">
	<label for="cargaHoraria">
		<g:message code="curso.cargaHoraria.label" default="Carga Horaria" />

	</label>
	<g:textField name="cargaHoraria" value="${cursoInstance?.cargaHoraria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'instituicaoRealizadora', 'error')} ">
	<label for="instituicaoRealizadora">
		<g:message code="curso.instituicaoRealizadora.label" default="Instituicao Realizadora" />

	</label>
	<g:textField name="instituicaoRealizadora" value="${cursoInstance?.instituicaoRealizadora}"/>
</div>



<tr class="prop">
    <td valign="top" class="name">
        <label for="arqAssociado"><g:message code="cursoInstance.arqAssociado.label" default="Anexar Arquivo" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: cursoInstance, field: 'arqAssociado', 'errors')}">
        <input type="file" id="arqAssociado" name="arqAssociado" required = "" />
    </td>
</tr>



