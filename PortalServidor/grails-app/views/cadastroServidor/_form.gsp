<%@ page import="portalservidor.CadastroServidor" %>


<%@ page import="portalservidor.CadastroServidor" %>



<g:javascript library="jquery" plugin="jquery"/>
<g:javascript src="jquery.maskedinput.min.js"/>
<g:javascript>

    $(document).ready(function(){
        $("#contato").mask("(99)9999-9999");
    });

</g:javascript>




<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'nomeServidor', 'error')} ">
    <label for="nomeServidor">
        <g:message code="cadastroServidor.nomeServidor.label" default="Nome do Servidor"  readonly="readonly"/>

    </label>
    <g:textField name="nomeServidor" maxlength="100" class="span10" placeholder="Nome do Servidor" value="${redirectView?.nomeServidor}" size="100" readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'matricula', 'error')} ">
    <label for="matricula">
        <g:message code="cadastroServidor.matricula.label" default="Matrícula" />

    </label>
    <g:textField name="matricula" value="${redirectView?.matricula}" class="span2" placeholder="Matrícula" readonly="readonly"/>
</div>


<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'dataExercicio', 'error')} required">
    <label for="dataExercicio">
        <g:message code="cadastroServidor.dataExercicio.label" default="Data que Entrou em Exercício" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dataExercicio" precision="day"  value="${redirectView?.dataExercicio}" readonly="readonly" />
</div>



<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'regimeTrabalho', 'error')} ">
    <label for="regimeTrabalho">
        <g:message code="cadastroServidor.regimeTrabalho.label" default="Regime de Trabalho" />

    </label>
    <g:textField name="regimeTrabalho" value="${redirectView?.regimeTrabalho}" class="span2" placeholder=".span2"  readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'cargoOcupa', 'error')} ">
    <label for="cargoOcupa">
        <g:message code="cadastroServidor.cargoOcupa.label" default="Cargo que Ocupa" />

    </label>
    <g:textField name="cargoOcupa" value="${redirectView?.cargoOcupa}" class="span10" placeholder=".span3" readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'nivel', 'error')} ">
    <label for="nivel">
        <g:message code="cadastroServidor.nivel.label" default="Nível" />

    </label>
    <g:textField name="nivel" value="${redirectView?.nivel}" class="span1" placeholder=".span1"  readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'lotacaoExercicio', 'error')} ">
    <label for="lotacaoExercicio">
        <g:message code="cadastroServidor.lotacaoExercicio.label" default="Lotação em Exercicio" />

    </label>
    <g:textField name="lotacaoExercicio" value="${redirectView?.lotacaoExercicio}" class="span10" placeholder=".span3"  readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'lotacaoOficial', 'error')} ">
    <label for="lotacaoOficial">
        <g:message code="cadastroServidor.lotacaoOficial.label" default="Lotação Oficial" />

    </label>
    <g:textField name="lotacaoOficial" value="${redirectView?.lotacaoOficial}" class="span10" placeholder=".span2"  readonly="readonly"/>
</div>


<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'emailPrincipal', 'error')} ">
    <label for="emailPrincipal">

        <g:message code="cadastroServidor.emailPrincipal.label" default="Email Principal" />

    </label>

    <g:textField name="emailPrincipal" value="${redirectView?.emailPrincipal}" class="span3" placeholder=".span2" readonly="readonly"/> @uft.edu.br


</div>

<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'emailSecundario', 'error')} ">
    <label for="emailSecundario">
        <g:message code="cadastroServidor.emailSecundario.label" default="Email Secundário" />

    </label>

    <g:textField name="emailSecundario" value="${redirectView?.emailSecundario}" class="span5" placeholder=".span2"    />
</div>

<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'telefone', 'error')} required">
    <label for="telefone">
        <g:message code="cadastroServidor.telefone.label" default="Telefone" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField id="contato" name="telefone" required="" value="${cadastroServidorInstance?.telefone}" class="span2" placeholder="Telefone  "/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'escolaridade', 'error')} ">
    <label for="escolaridade">
        <g:message code="cadastroServidor.escolaridade.label" default="Escolaridade" />

    </label>
    <g:textField name="escolaridade" value="${redirectView?.escolaridade}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'funcao', 'error')} required">
    <label for="funcao">
        <g:message code="cadastroServidor.funcao.label" default="Função que desempenha atualmente" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="funcao" required="" value="${cadastroServidorInstance?.funcao}" class="span5 " placeholder="Função" />
</div>


<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'descricaoAtividade', 'error')} required">
    <label for="descricaoAtividade">
        <g:message code="cadastroServidor.descricaoAtividade.label" default="Descrição das  Atividade que Desempenha A tualmente" />
        <span class="required-indicator">*</span>
    </label>
    <g:textArea name="descricaoAtividade" rows="3" class="span10" maxlength="300" required="" value="${cadastroServidorInstance?.descricaoAtividade}"/>
</div>




<div class="fieldcontain ${hasErrors(bean: cadastroServidorInstance, field: 'outrosDados', 'error')} ">
	<label for="outrosDados">
		<g:message code="cadastroServidor.outrosDados.label" default="" />  Caso tenha algum dado errado, informe aqui nesse campo!
		
	</label>
    <g:textArea name="outrosDados" rows="3" class="span10" maxlength="300" required="" value="${cadastroServidorInstance?.outrosDados}"/>
</div>



