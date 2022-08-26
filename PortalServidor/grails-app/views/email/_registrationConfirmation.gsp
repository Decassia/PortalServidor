<center>
    <h1>Olá  ${cadastrarRemocaoInstance.nomeChefe}<p> O(A) "${cadastrarRemocaoInstance.nomeSubordinado}"</h1>
    <h1> Efetuou o seu cadastro no REMOÇÃO INTERNA, dê o seu parecer clicando no link abaixo</h1>

    <g:link base="http://acerola.uft.edu.br:8080/remocaointerna" action="create" controller="parecerChefia" params="['cadastrarRemocao.id': cadastrarRemocaoInstance.id]">clique aqui</g:link>


</center>

