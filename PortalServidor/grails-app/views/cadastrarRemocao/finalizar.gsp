<%--
  Created by IntelliJ IDEA.
  User: joaovictor
  Date: 03/06/13
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
  <title>Finalizar processo de remoção</title>
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
                    <li class="disabled"><a href="#"><span class="badge badge-success">1</span> Dados Funcionais</a></li>
                    <li class="disabled"><a href="#"><span class="badge badge-success">2</span> Cursos de Capacitação</a></li>
                    <li class="disabled"><a href="#"><span class="badge badge-success">3</span> Formação Acadêmica</a></li>
                    <li class="disabled"><a href="#"><span class="badge badge-success">4</span> Remoção Interna</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </div>
</div>


<div class="container">
    <div class="row">
        <div class="span12">
            <h1 style="text-align:center; margin-top:50px;">Cadastro de Remoção Concluído com sucesso.</h1>
            <p style="text-align:center;"><g:link controller="logout">Clique aqui para sair.</g:link></p>
        </div>
    </div>
</div>
</body>
</html>