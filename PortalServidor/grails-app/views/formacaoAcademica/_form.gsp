<%@ page import="portalservidor.FormacaoAcademica" %>





<div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'cadastrarRemocao', 'error')} required">
	<label for="nomeServidor">
		<g:message code="formacaoAcademica.cadastrarRemocao.label" default="Nome do Servidor" />
		<span class="required-indicator">*</span>
	</label>
     <g:textField name="nomeServidor" value="${redirectView?.nomeServidor}" readonly="readonly"></g:textField>
</div>

<div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'cadastrarRemocao', 'error')} required">
    <label for="idPessoa">
        <g:message code="formacaoAcademica.cadastrarRemocao.label" default="Id Pessoa" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="idPessoa" value="${redirectView?.idPessoa}"></g:textField>
</div>

<div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'cadastrarRemocao', 'error')} required">
    <label for="matriculaServidor">
        <g:message code="formacaoAcademica.cadastrarRemocao.label" default="Matricula do Servidor"  />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="matriculaServidor" value="${redirectView?.matriculaServidor}" readonly="readonly"></g:textField>
</div>


<div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'nomeCurso', 'error')} required">
    <label for="nomeCurso">
        <g:message code="formacaoAcademica.nomeCurso.label" default="Nome do Curso" />

    </label>
    <g:textField name="nomeCurso" value="${formacaoAcademicaInstance?.nomeCurso}" />
</div>

<div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'tipoCurso', 'error')} ">
    <label for="tipoCurso">
        <g:message code="formacaoAcademica.tipoCurso.label" default="Tipo de Formação" />

    </label>
    <g:select name="tipoCurso" from="${formacaoAcademicaInstance.constraints.tipoCurso.inList}" value="${formacaoAcademicaInstance?.tipoCurso}" valueMessagePrefix="formacaoAcademica.tipoCurso" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'cargaHoraria', 'error')} ">
    <label for="cargaHoraria">
        <g:message code="formacaoAcademica.cargaHoraria.label" default="Carga Horária" />

    </label>
    <g:textField name="cargaHoraria" value="${formacaoAcademicaInstance?.cargaHoraria}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: formacaoAcademicaInstance, field: 'instituicaoRealizadora', 'error')} ">
    <label for="instituicaoRealizadora">
        <g:message code="formacaoAcademica.instituicaoRealizadora.label" default="Instituição Realizadora" />

    </label>
    <g:textField name="instituicaoRealizadora" value="${formacaoAcademicaInstance?.instituicaoRealizadora}"/>
</div>



<tr class="prop">
    <td valign="top" class="name">
        <label for="arqAssociado"><g:message code="formacaoAcademicaInstance.arqAssociado.label" default="Anexar Arquivo" /></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: formacaoAcademicaInstance, field: 'arqAssociado', 'errors')} required">
        <input type="file" id="arqAssociado" name="arqAssociado" required = "" />
    </td>
</tr>



