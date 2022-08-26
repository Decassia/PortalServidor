<%@ page import="portalservidor.ParecerDiretor" %>


<div class="fieldcontain ${hasErrors(bean: parecerDiretorInstance, field: 'cadastroRemocao', 'error')} required">
    <label for="cadastroRemocao">
        <g:message code="parecerDiretor.cadastroRemocao.label" default="Nome do Servidor" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="cadastroRemocao" readonly="readonly" name="cadastroRemocao.id" from="${portalservidor.CadastrarRemocao.list()}" optionKey="id" required="" value="${parecerDiretor}" noSelection="['': '']" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: parecerDiretorInstance, field: 'parecerDiretor', 'error')} required">
	<label for="parecerDiretor">
		<g:message code="parecerDiretor.parecerDiretor.label" default="Parecer do chefe Mediato" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="parecerDiretor" from="${parecerDiretorInstance.constraints.parecerDiretor.inList}" required="" value="${parecerDiretorInstance?.parecerDiretor}" noSelection="['': '']" valueMessagePrefix="parecerDiretor.parecerDiretor"/>
</div>


