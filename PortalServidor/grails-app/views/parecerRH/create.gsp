<%@ page import="portalservidor.ParecerRH" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'cadastro.label', default: 'Cadastro de Remoção ')}" />

    <title><g:message code="default.create.label" args="[entityName]" /></title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="span3">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
        </div>
        <div class="span9">
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
        </div>
    </div>
    <div class="row">
        <div class="sidebar span3">
            <div class="well" role="navigation">
                <ul class="nav nav-list">
                    <li class="nav-header">Parecer Chefia Mediata</li>
                </ul>


                <ul class="nav nav-list">
                    <sec:ifLoggedIn>

                        <div  class="controls">  <g:link controller="logout">Sair do Sistema</g:link></div>





        <div class="span9">

            <div id="list-cadastro" class="content scaffold-list" role="main">
                    <br><br>
                    <a data-toggle="modal" href="#my-modal">
                        <g:message code="default.button.create.label"/>Palmas
                    </a>

                <div id="my-modal" class="modal fade" style="display: none;">
                    <fieldset>
                        <div class="modal-header">
                            <a class="close" data-dismiss="modal">×</a>
                            <h3> Servidores</h3>
                        </div>
                        <div class="modal-body">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <td><h6>Nome do Servidor</h6></td>
                                    <td><h6>Formação Acadêmica</h6></td>
                                    <td><h6>Curso de Capacitação</h6></td>
                                    <td><h6>Campus de  Origem</h6></td>
                                    <td><h6>Destino -1ª Opção</h6></td>
                                    <td><h6>Destino -2ª Opção</h6></td>


                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${remocao}" var="pegar">
                                    <tr>

                                        <td class="caption">${pegar.nomeSubordinado}</td>
                                        <td>${pegar.pegarCurso}</td>
                                        <td>${pegar.cursoCadastro}</td>
                                        <td>${pegar.campus}</td>
                                        <td>${pegar.primeiraOpcao}</td>
                                        <td>${pegar.segundaOpcao}</td>


                                    </tr>
                                </g:each>
                            </table>
                        </div>
                    </fieldset>
                </div>


                    <div id="modaal-List" class="content scaffold-list" role="main">

                  <a data-toggle="modal" href="#modaal">

                    <g:message code="default.button.create.label"/> Arraias
                          </a>


                    <div id="modaal" class="modal fade" style="display: none;">
                        <fieldset>
                            <div class="modal-header">
                                <a class="close" data-dismiss="modal">×</a>
                                <h3> Campus Arraias</h3>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <td><h6>Nome do Servidor</h6></td>
                                        <td><h6>Formação Acadêmica</h6></td>
                                        <td><h6>Curso de Capacitação</h6></td>
                                        <td><h6>Campus de  Origem</h6></td>
                                        <td><h6>Destino -1ª Opção</h6></td>
                                        <td><h6>Destino -2ª Opção</h6></td>


                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${remocaoArraias}" var="pegar">
                                        <tr>

                                            <td>${pegar.nomeSubordinado}</td>
                                            <td>${pegar.pegarCurso}</td>
                                            <td>${pegar.cursoCadastro}</td>
                                            <td>${pegar.campus}</td>
                                            <td>${pegar.primeiraOpcao}</td>
                                            <td>${pegar.segundaOpcao}</td>




                                        </tr>
                                    </g:each>
                                </table>
                            </div>
                        </fieldset>
                    </div>

                    <div id="list" class="content scaffold-list" role="main">
                            <a  data-toggle="modal" href="#my">

                                <g:message code="default.button.create.label"/>Araguaina
                            </a>

                        <div id="my" class="modal fade" style="display: none;">
                            <fieldset>
                                <div class="modal-header">
                                    <a class="close" data-dismiss="modal">×</a>
                                    <h3> Campus Araguaína</h3>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-striped">
                                        <thead>
                                        <tr>
                                            <td><h6>Nome do Servidor</h6></td>
                                            <td><h6>Formação Acadêmica</h6></td>
                                            <td><h6>Curso de Capacitação</h6></td>
                                            <td><h6>Campus de  Origem</h6></td>
                                            <td><h6>Destino -1ª Opção</h6></td>
                                            <td><h6>Destino -2ª Opção</h6></td>


                                        </tr>
                                        </thead>
                                        <tbody>
                                        <g:each in="${remocaoAraguaina}" var="pegar">
                                            <tr>

                                                <td>${pegar.nomeSubordinado}</td>
                                                <td>${pegar.pegarCurso}</td>
                                                <td>${pegar.cursoCadastro}</td>
                                                <td>${pegar.campus}</td>
                                                <td>${pegar.primeiraOpcao}</td>
                                                <td>${pegar.segundaOpcao}</td>




                                            </tr>
                                        </g:each>
                                    </table>
                                </div>
                            </fieldset>
                        </div>

                        <div id="listModal" class="content scaffold-list" role="main">

                                <a data-toggle="modal" href="#myModal">

                                    <g:message code="default.button.create.label"/>Porto Nacional
                                </a>


                            <div id="myModal" class="modal fade" style="display: none;">
                                <fieldset>
                                    <div class="modal-header">
                                        <a class="close" data-dismiss="modal">×</a>
                                        <h3> Campus Porto Nacional</h3>
                                    </div>
                                    <div class="modal-body">
                                        <table class="table table-striped">
                                            <thead>
                                            <tr>
                                                <td><h6>Nome do Servidor</h6></td>
                                                <td><h6>Formação Acadêmica</h6></td>
                                                <td><h6>Curso de Capacitação</h6></td>
                                                <td><h6>Campus de  Origem</h6></td>
                                                <td><h6>Destino -1ª Opção</h6></td>
                                                <td><h6>Destino -2ª Opção</h6></td>


                                            </tr>
                                            </thead>
                                            <tbody>
                                            <g:each in="${remocaoPorto}" var="pegar">
                                                <tr>

                                                    <td>${pegar.nomeSubordinado}</td>
                                                    <td>${pegar.pegarCurso}</td>
                                                    <td>${pegar.cursoCadastro}</td>
                                                    <td>${pegar.campus}</td>
                                                    <td>${pegar.primeiraOpcao}</td>
                                                    <td>${pegar.segundaOpcao}</td>




                                                </tr>
                                            </g:each>
                                        </table>
                                    </div>
                                </fieldset>
                            </div>


                  <div id="modalList" class="content scaffold-list" role="main">

                         <a data-toggle="modal" href="#modal">

                                     <g:message code="default.button.create.label"/> Miracema
                         </a>


                    <div id="modal" class="modal fade" style="display: none;">
                        <fieldset>
                            <div class="modal-header">
                                <a class="close" data-dismiss="modal">×</a>
                                <h3> Campus Miracema</h3>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <td><h6>Nome do Servidor</h6></td>
                                        <td><h6>Formação Acadêmica</h6></td>
                                        <td><h6>Curso de Capacitação</h6></td>
                                        <td><h6>Campus de  Origem</h6></td>
                                        <td><h6>Destino -1ª Opção</h6></td>
                                        <td><h6>Destino -2ª Opção</h6></td>


                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${remocaoMiracema}" var="pegar">
                                        <tr>

                                            <td>${pegar.nomeSubordinado}</td>
                                            <td>${pegar.pegarCurso}</td>
                                            <td>${pegar.cursoCadastro}</td>
                                            <td>${pegar.campus}</td>
                                            <td>${pegar.primeiraOpcao}</td>
                                            <td>${pegar.segundaOpcao}</td>




                                        </tr>
                                    </g:each>
                                </table>
                            </div>
                        </fieldset>
                    </div>

                    <div id="modal-List" class="content scaffold-list" role="main">

                          <a data-toggle="modal" href="#modal">

                            <g:message code="default.button.create.label"/> Gurupi
                          </a>


                    <div id="modal" class="modal fade" style="display: none;">
                        <fieldset>
                            <div class="modal-header">
                                <a class="close" data-dismiss="modal">×</a>
                                <h3> Campus Gurupi</h3>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <td><h6>Nome do Servidor</h6></td>
                                        <td><h6>Formação Acadêmica</h6></td>
                                        <td><h6>Curso de Capacitação</h6></td>
                                        <td><h6>Campus de  Origem</h6></td>
                                        <td><h6>Destino -1ª Opção</h6></td>
                                        <td><h6>Destino -2ª Opção</h6></td>


                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${remocaoGurupi}" var="pegar">
                                        <tr>

                                            <td>${pegar.nomeSubordinado}</td>
                                            <td>${pegar.pegarCurso}</td>
                                            <td>${pegar.cursoCadastro}</td>
                                            <td>${pegar.campus}</td>
                                            <td>${pegar.primeiraOpcao}</td>
                                            <td>${pegar.segundaOpcao}</td>




                                        </tr>
                                    </g:each>
                                </table>
                            </div>
                        </fieldset>
                    </div>


                    <div id="modalist" class="content scaffold-list" role="main">

                  <a data-toggle="modal" href="#modall">

                    <g:message code="default.button.create.label"/> Tocantinópolis
                          </a>


                    <div id="modall" class="modal fade" style="display: none;">
                        <fieldset>
                            <div class="modal-header">
                                <a class="close" data-dismiss="modal">×</a>
                                <h3> Campus Tocantinópolis</h3>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <td><h6>Nome do Servidor</h6></td>
                                        <td><h6>Formação Acadêmica</h6></td>
                                        <td><h6>Curso de Capacitação</h6></td>
                                        <td><h6>Campus de  Origem</h6></td>
                                        <td><h6>Destino -1ª Opção</h6></td>
                                        <td><h6>Destino -2ª Opção</h6></td>


                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${remocaoTocantinopolis}" var="pegar">
                                        <tr>

                                            <td>${pegar.nomeSubordinado}</td>
                                            <td>${pegar.pegarCurso}</td>
                                            <td>${pegar.cursoCadastro}</td>
                                            <td>${pegar.campus}</td>
                                            <td>${pegar.primeiraOpcao}</td>
                                            <td>${pegar.segundaOpcao}</td>




                                        </tr>
                                    </g:each>
                                </table>
                            </div>
                        </fieldset>
                    </div>

                    <div id="modalt" class="content scaffold-list" role="main">

                  <a data-toggle="modal" href="#modalnada">

                    <g:message code="default.button.create.label"/> Reitoria
                          </a>


                    <div id="modalnada" class="modal fade" style="display: none;">
                        <fieldset>
                            <div class="modal-header">
                                <a class="close" data-dismiss="modal">×</a>
                                <h3> Reitoria</h3>
                            </div>
                            <div class="modal-body">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <td><h6>Nome do Servidor</h6></td>
                                        <td><h6>Formação Acadêmica</h6></td>
                                        <td><h6>Curso de Capacitação</h6></td>
                                        <td><h6>Campus de  Origem</h6></td>
                                        <td><h6>Destino -1ª Opção</h6></td>
                                        <td><h6>Destino -2ª Opção</h6></td>


                                    </tr>
                                    </thead>
                                    <tbody>
                                    <g:each in="${remocaoReitoria}" var="pegar">
                                        <tr>

                                            <td>${pegar.nomeSubordinado}</td>
                                            <td>${pegar.pegarCurso}</td>
                                            <td>${pegar.cursoCadastro}</td>
                                            <td>${pegar.campus}</td>
                                            <td>${pegar.primeiraOpcao}</td>
                                            <td>${pegar.segundaOpcao}</td>




                                        </tr>
                                    </g:each>
                                </table>
                            </div>
                        </fieldset>
                    </div>


                    </sec:ifLoggedIn>
                </ul>
            </div>
        </div>

                <div class="page-header">
                    <h1><g:message code="default.create.label" args="[entityName]" /></h1>
                </div>

                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <g:hasErrors bean="${parecerRHInstance}">
                    <ul class="errors" role="alert">
                        <g:eachError bean="${parecerRHInstance}" var="error">
                            <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </g:hasErrors>
                <g:form action="save" method="post"  enctype="multipart/form-data">
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset><br>

                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn-primary" value="Enviar" />
                    </fieldset>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>



