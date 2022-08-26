<%@ page import="portalservidor.BuscarVagas; portalservidor.CadastrarRemocao" %>



<!--Tem alteração desta linha-->
<g:javascript>
    function removeNaPrimeira(valor){
        var elementosPrimOpcao = document.getElementsByName("optionPrimeiraOpcao");
        for(i=0;i<elementosPrimOpcao.length;i++){
            if(elementosPrimOpcao[i].value==valor) elementosPrimOpcao[i].style.display="none";
            else elementosPrimOpcao[i].style.display="";
        }
    }
    function removeNaSegunda(valor){
        var elementosSegOpcao = document.getElementsByName("optionSegundaOpcao");
        for(i=0;i<elementosSegOpcao.length;i++){
            if(elementosSegOpcao[i].value==valor) elementosSegOpcao[i].style.display="none";
            else elementosSegOpcao[i].style.display="";
        }
    }


</g:javascript>



<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'email', 'error')} ">
    <label for="email">
        <g:message code="cadastrarRemocao.email.label" default="Email do Chefe Imediato" />

    </label>
    <g:field type="email" name="email" value="${redirectChefe?.email}"/>   Digite o Email, caso o campo esteja em branco!
</div>


<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'matriculaChefe', 'error')} required">
    <label for="matriculaChefe">
        <g:message code="cadastrarRemocao.matriculaChefe.label" default="Matricula do Chefe Imediato" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="matriculaChefe" type="number" value="${redirectChefe?.matriculaChefe}" required="" readonly="readonly"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nomeChefe', 'error')} ">
    <label for="nomeChefe">
        <g:message code="cadastrarRemocao.nomeChefe.label" default="Nome do Chefe Imediato" />

    </label>
    <g:textField name="nomeChefe" value="${redirectChefe?.nomeChefe}" readonly="readonly"/>
</div>


<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'matriculaSubordinado', 'error')} required">
    <label for="matriculaSubordinado">
        <g:message code="cadastrarRemocao.matriculaSubordinado.label" default="Matricula do Servidor" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="matriculaSubordinado" type="number" value="${redirectChefe?.matriculaSubordinado}" readonly="readonly" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'idContrato', 'error')} required">
    <label for="idContrato">
        <g:message code="cadastrarRemocao.matriculaSubordinado.label" default="Número do Contrato do Servidor" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="idContrato" type="number" value="${redirectChefe?.idContrato}" required=""/>
</div>
<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nivel', 'error')} required">
    <label for="nivel">
        <g:message code="cadastrarRemocao.matriculaSubordinado.label" default="Nível" />
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="nivel" type="number" value="${redirectChefe?.nivel}" readonly="readonly" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'dataExercicio', 'error')} required">
    <label for="dataExercicio">
        <g:message code="cadastroServidor.dataExercicio.label" default="Data que Entrou em Exercício" />
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="dataExercicio" precision="day"  value="${redirectChefe?.dataExercicio}" readonly="readonly" />
</div>



<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nomeSubordinado', 'error')} ">
    <label for="nomeSubordinado">
        <g:message code="cadastrarRemocao.nomeSubordinado.label" default="Nome do Servidor" />

    </label>
    <g:textField name="nomeSubordinado" value="${redirectChefe?.nomeSubordinado}"/>
</div>




<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nomeSubordinado', 'error')} ">
    <label for="outros">
        <g:message code="cadastrarRemocao.outros.label" default="Unidade de Lotação" />
    </label>
        <g:textField name="campus" value="${redirectChefe?.campus}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nomeSubordinado', 'error')} ">
    <label for="outros">
        <g:message code="cadastrarRemocao.outros.label" default="Cargo" />
     </label>
        <g:textField name="cargo" value="${redirectChefe?.cargo}"/>
</div>


<h5> Escolha a Unidade de Destino</h5>
<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'primeiraOpcao', 'error')} ">
    <label for="primeiraOpcao">
        <g:message code="cadastrarRemocao.primeiraOpcao.label" default="Primeira Opção" />
        <span class="required-indicator">*</span>
    </label>

    <select name="primeiraOpcao" onblur="removeNaSegunda(this.value)">
        <option></option>
        <g:each in="${pegaVaga}" var="pega">
            <option name="optionPrimeiraOpcao" value="${pega}">${pega}</option>
        </g:each>
    </select>
</div>





<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'segundaOpcao', 'error')} ">
    <label for="segundaOpcao">
        <g:message code="cadastrarRemocao.segundaOpcao.label" default="Segunda Opção" />

    </label>

    <select name="segundaOpcao" onblur="removeNaPrimeira(this.value)">
        <option></option>
        <g:each in="${pegaVaga}" var="pega">
            <option name="optionSegundaOpcao" value="${pega}">${pega}</option>
        </g:each>
    </select>
</div>




<div class="fieldcontain ${hasErrors(bean: cadastrarRemocaoInstance, field: 'nomeSubordinado', 'error')} ">
    <label for="outros">
        <g:message code="cadastrarRemocao.outros.label" default="Informe outros Dados, caso haja erros" />

    </label>
    <g:textField name="outros" value="${cadastrarRemocaoInstance?.outros}"/>
</div>









