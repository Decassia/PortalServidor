package portalservidor
import java.sql.Date

class   CadastroServidor implements Serializable{

    Long id
    //dados mapeados
    def IdPessoa
    String nomeServidor
    Long matricula
    Date dataExercicio
    String regimeTrabalho
    String cargoOcupa
    String nivel
    String lotacaoExercicio
    String lotacaoOficial
    // String campus
    String emailPrincipal
    String emailSecundario
    String telefone
    String funcao
    def idContrato
   //Escolaridade
    String escolaridade
    String outrosDados

    String descricaoAtividade


    static constraints = {
        nomeServidor(unique: true)
        matricula( )
        dataExercicio()
        regimeTrabalho( )
        cargoOcupa()
        nivel()
        lotacaoExercicio()
        lotacaoOficial()
        // campus()
        emailPrincipal()
        emailSecundario()

        //Outra tabela


        telefone(blank: false)
        funcao(blank: false)
        descricaoAtividade(maxSize:300, blank: false)


    }

    static mapping = {
        datasources(['lookup'])
    }

    String toString (){
        nomeServidor
    }
}
