<%@ page import="portalservidor.ParecerChefia" %>




<div class="fieldcontain ${hasErrors(bean: parecerChefiaInstance, field: 'cadastrarRemocao', 'error')} required">
    <label for="cadastrarRemocao">
        <g:message code="parecerChefia.cadastrarRemocao.label" default="Nome do Servidor" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="cadastrarRemocao" name="cadastrarRemocao.id" from="${portalservidor.CadastrarRemocao.list()}" optionKey="id" required="" value="${parecerChefiaInstance?.cadastrarRemocao?.id}"  noSelection="['': '']"  readonly="readonly" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: parecerChefiaInstance, field: 'parecerChefiaMediato', 'error')} required">
	<label for="parecerChefiaMediato">
		<g:message code="parecerChefia.parecerChefiaMediato.label" default="Parecer Chefia Imediata" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="parecerChefiaMediato" from="${parecerChefiaInstance.constraints.parecerChefiaMediato.inList}" noSelection="['': '']" required="" value="${parecerChefiaInstance?.parecerChefiaMediato}" valueMessagePrefix="parecerChefia.parecerChefiaMediato"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parecerChefiaInstance, field: 'outroServidor', 'error')} required">
    <label for="outroServidor">
        <g:message code="parecerChefia.outroServidor.label" default="Há necessidade de outro Servidor?" />
        <span class="required-indicator">*</span>
    </label>
    <g:select name="outroServidor" from="${parecerChefiaInstance.constraints.outroServidor.inList}" noSelection="['': '']" required="" value="${parecerChefiaInstance?.outroServidor}" valueMessagePrefix="parecerChefia.outroServidor"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parecerChefiaInstance, field: 'emailChefiaMediato', 'error')} ">
	<label for="emailChefiaMediato">
		<g:message code="parecerChefia.emailChefiaMediato.label" default="Email Chefia Mediata - Diretor do Campus" />
		
	</label>
	<g:select name="emailChefiaMediato" from="${parecerChefiaInstance.constraints.emailChefiaMediato.inList}" value="${parecerChefiaInstance?.emailChefiaMediato}" valueMessagePrefix="parecerChefia.emailChefiaMediato" noSelection="['': '']"/> Selecione essa opção se vc for lotado em algum campus.
</div>


<div class="fieldcontain ${hasErrors(bean: parecerChefiaInstance, field: 'emailReitoria', 'error')} ">
	<label for="emailReitoria">
		<g:message code="parecerChefia.emailReitoria.label" default="Email da Chefia Mediata - Reitoria" />
		
	</label>
	<g:textField name="emailReitoria" value="${parecerChefiaInstance?.emailReitoria}"/>  Preencha o email do chefe Mediato, caso vc seja lotado na reitoria.
</div>

