
<%@ page import="portalservidor.CadastroServidor" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: 'Dados')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="brand" href="#">UFT</a>
                <div class="nav-collapse collapse">
                    <p class="navbar-text pull-right">
                        <g:link controller="logout">Sair</g:link>
                    </p>
                    <ul class="nav">
                        <li class="active"><g:link controller="cadastroServidor"><span class="badge badge-info">1</span> Dados Funcionais</g:link></li>
                        <li class="disabled"><a href="#"><span class="badge">2</span> Cursos de Capacitação</a></li>
                        <li class="disabled"><a href="#"><span class="badge">3</span> Formação Acadêmica</a></li>
                        <li class="disabled"><a href="#"><span class="badge">4</span> Remoção Interna</a></li>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="span12">
                <g:if test="${flash.message}">
                    <div class="alert alert-info" role="status"><strong>${flash.message}</strong></div>
                </g:if>
                <g:if test="${flash.success}">
                    <div class="alert alert-success" role="status"><strong>${flash.success}</strong></div>
                </g:if>
                <g:if test="${flash.error}">
                    <div class="alert alert-error" role="status"><strong>${flash.error}</strong></div>
                </g:if>
                <g:if test="${flash.warning}">
                    <div class="alert alert-warning" role="status"><strong>${flash.warning}</strong></div>
                </g:if>

                <div class="page-header">
                    <h3><g:message code="default.show.label" args="[entityName]" /></h3>
                </div>

                <dl class="property-list cadastroServidor">

                    <g:if test="${cadastroServidorInstance?.nomeServidor}">
                        <dd class="fieldcontain">
                        <dt><span id="nomeServidor-label" class="property-label"><g:message code="cadastroServidor.nomeServidor.label" default="Nome Servidor" /></span></dt>

                        <span class="property-value" aria-labelledby="nomeServidor-label"><g:fieldValue bean="${cadastroServidorInstance}" field="nomeServidor"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.matricula}">
                        <dd class="fieldcontain">
                        <dt> <span id="matricula-label" class="property-label"><g:message code="cadastroServidor.matricula.label" default="Matricula" /></span></dt>

                        <span class="property-value" aria-labelledby="matricula-label"><g:fieldValue bean="${cadastroServidorInstance}" field="matricula"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.dataExercicio}">
                        <dd class="fieldcontain">
                        <dt><span id="dataExercicio-label" class="property-label"><g:message code="cadastroServidor.dataExercicio.label" default="Data de Exercicio" /></span></dt>

                        <span class="property-value" aria-labelledby="dataExercicio-label"><g:fieldValue bean="${cadastroServidorInstance}" field="dataExercicio"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.regimeTrabalho}">
                        <dd class="fieldcontain">
                        <dt><span id="regimeTrabalho-label" class="property-label"><g:message code="cadastroServidor.regimeTrabalho.label" default="Regime Trabalho" /></span></dt>

                        <span class="property-value" aria-labelledby="regimeTrabalho-label"><g:fieldValue bean="${cadastroServidorInstance}" field="regimeTrabalho"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.cargoOcupa}">
                        <dd class="fieldcontain">
                        <dt> <span id="cargoOcupa-label" class="property-label"><g:message code="cadastroServidor.cargoOcupa.label" default="Cargo Ocupa" /></span></dt>

                        <span class="property-value" aria-labelledby="cargoOcupa-label"><g:fieldValue bean="${cadastroServidorInstance}" field="cargoOcupa"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.nivel}">
                        <dd class="fieldcontain">
                        <dt><span id="nivel-label" class="property-label"><g:message code="cadastroServidor.nivel.label" default="Nivel" /></span></dt>

                        <span class="property-value" aria-labelledby="nivel-label"><g:fieldValue bean="${cadastroServidorInstance}" field="nivel"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.lotacaoExercicio}">
                        <dd class="fieldcontain">
                        <dt><span id="lotacaoExercicio-label" class="property-label"><g:message code="cadastroServidor.lotacaoExercicio.label" default="Lotacao Exercicio" /></span></dt>

                        <span class="property-value" aria-labelledby="lotacaoExercicio-label"><g:fieldValue bean="${cadastroServidorInstance}" field="lotacaoExercicio"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.lotacaoOficial}">
                        <dd class="fieldcontain">
                        <dt><span id="lotacaoOficial-label" class="property-label"><g:message code="cadastroServidor.lotacaoOficial.label" default="Lotacao Oficial" /></span></dt>

                        <span class="property-value" aria-labelledby="lotacaoOficial-label"><g:fieldValue bean="${cadastroServidorInstance}" field="lotacaoOficial"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.emailPrincipal}">
                        <dd class="fieldcontain">
                        <dt><span id="emailPrincipal-label" class="property-label"><g:message code="cadastroServidor.emailPrincipal.label" default="Email Principal" /></span></dt>

                        <span class="property-value" aria-labelledby="emailPrincipal-label"><g:fieldValue bean="${cadastroServidorInstance}" field="emailPrincipal"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.emailSecundario}">
                        <dd class="fieldcontain">
                        <dt><span id="emailSecundario-label" class="property-label"><g:message code="cadastroServidor.emailSecundario.label" default="Email Secundario" /></span></dt>

                        <span class="property-value" aria-labelledby="emailSecundario-label"><g:fieldValue bean="${cadastroServidorInstance}" field="emailSecundario"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.telefone}">
                        <dd class="fieldcontain">
                        <dt><span id="telefone-label" class="property-label"><g:message code="cadastroServidor.telefone.label" default="Telefone" /></span></dt>

                        <span class="property-value" aria-labelledby="telefone-label"><g:fieldValue bean="${cadastroServidorInstance}" field="telefone"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.funcao}">
                        <dd class="fieldcontain">
                        <dt><span id="funcao-label" class="property-label"><g:message code="cadastroServidor.funcao.label" default="Funcao" /></span></dt>

                        <span class="property-value" aria-labelledby="funcao-label"><g:fieldValue bean="${cadastroServidorInstance}" field="funcao"/></span>

                        </dd>
                    </g:if>

                    <g:if test="${cadastroServidorInstance?.descricaoAtividade}">
                        <dd class="fieldcontain">
                        <dt><span id="descricaoAtividade-label" class="property-label"><g:message code="cadastroServidor.descricaoAtividade.label" default="Descricao Atividade" /></span></dt>

                        <span class="property-value" aria-labelledby="descricaoAtividade-label"><g:fieldValue bean="${cadastroServidorInstance}" field="descricaoAtividade"/></span>

                        </dd>
                    </g:if>

                </dl>
                <g:form>
                    <fieldset class="buttons">
                        <g:hiddenField name="id" value="${cadastroServidorInstance?.id}" />
                        <g:link class="btn btn-primary" action="edit" id="${cadastroServidorInstance?.id}">
                            <i class=" icon-edit icon-white"></i>
                            <g:message code="default.button.edit.label" default="Edit" />
                        </g:link>


                        <g:link class="btn btn-primary pull-right" controller="curso" action="index">
                            Confirmar e Cadastrar cursos >>
                        </g:link>
                    </fieldset>
                </g:form>

            </div>
        </div>
    </div>
</body>
</html>

