<%@ page import="portalservidor.ParecerRH" %>


<div class="fieldcontain ${hasErrors(bean: parecerRHInstance, field: 'cadastrarRemocao', 'error')} required">
    <label for="cadastrarRemocao">
        <g:message code="parecerRH.cadastrarRemocao.label" default="Nome do Servidor" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="cadastrarRemocao" readonly="readonly" name="cadastrarRemocao.id" noSelection="['': '']" from="${portalservidor.CadastrarRemocao.list()}" optionKey="id" required="" value="${parecerRH}" class="many-to-one"/>
</div>


<div class="fieldcontain ${hasErrors(bean: parecerRHInstance, field: 'parecerRH', 'error')} required">
    <label for="parecerRH">
        <g:message code="parecerRH.parecerRH.label" default="Parecer GDH" />
        <span class="required-indicator">*</span>
    </label>
    <g:select id="selectParecerRH" name="parecerRH" from="${parecerRHInstance.constraints.parecerRH.inList}" required="" value="${parecerRHInstance?.parecerRH}" noSelection="['': '']" valueMessagePrefix="parecerRH.parecerRH" onblur="desativaJustificativa()"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parecerRHInstance, field: 'justificativa', 'error')} required">
    <label for="justificativa">
        <g:message code="parecerRH.justificativa.label" default="Justificativa" />
        <span class="required-indicator">*</span>
    </label>
    <g:if test="${parecerRHInstance.parecerRH=='Não atende à necessidade do Campus'}">
        <g:textField size="200" name="justificativa" maxlength="100" required="" value="${parecerRHInstance?.justificativa}"/>
    </g:if>
    <g:else>
        <g:textField id="textFieldJustificativa" size="200" name="justificativa" maxlength="100" required="" value="${parecerRHInstance?.justificativa}"/>
    </g:else>
</div>

<g:javascript>
    function desativaJustificativa(){
        var selectParecerRH = document.getElementById("selectParecerRH");
        var textFieldJustificativa = document.getElementById("textFieldJustificativa");
        if(selectParecerRH.value=="Atende à necessidade do Campus"){
            textFieldJustificativa.disabled=true;
        }
        else textFieldJustificativa.disabled=false;
    }
</g:javascript>

