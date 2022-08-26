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
  <title>Finalizar processo de remoção</title>
</head>
<body>
    <h1 style="text-align:center; margin-top:50px;">  O Seu parecer foi efetuado com Sucesso! </h1>
    <ul class="nav nav-list">
        <sec:ifLoggedIn>
            <div  class="controls">  <g:link controller="logout">Sair do Sistema</g:link></div>
        </sec:ifLoggedIn>
    </ul>

</body>
</html>