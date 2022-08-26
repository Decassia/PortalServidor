package portalservidor
import java.sql.Date

class BuscarServidor implements Serializable {
    Long id
    Long idPessoa
    String nomeServidor
    Long matricula
    Date dataExercicio
    String regimeTrabalho
    String cargoOcupa
    String lotacaoExercicio
    String lotacaoOficial
    String campus
    String nivel
    String escolaridade
    String emailSecundario
    String emailPrincipal



    static constraints = {
        nomeServidor()
        matricula()
        idPessoa ()
        dataExercicio()
        regimeTrabalho()
        cargoOcupa()
        lotacaoExercicio()
        lotacaoOficial()




    }

    static mapping = {
        datasources(['DEFAULT'])
        table 'buscarfuncionario' //nome da view
        version false //desativar a coluna de versão
        id column:'id_contrato_rh'
        nomeServidor column: 'Nome_Funcionario'
        idPessoa column: 'id_pessoa'
        matricula column: 'matr_externa'
        dataExercicio column: 'Data_Exercicio'
        regimeTrabalho column: 'Jornada_Trabalho'
        cargoOcupa column: 'Cargo'
        lotacaoExercicio column: 'Lotacao_Exercicio'
        lotacaoOficial   column:  'Lotacao_Oficial'
        nivel column: 'nivel'
        campus column: 'campus'
        emailSecundario column: 'emailsecundario'
        escolaridade column: 'Escolaridade'
        emailPrincipal column:' email_principal'




    }

}


