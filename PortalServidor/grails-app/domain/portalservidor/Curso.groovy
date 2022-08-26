package portalservidor
import java.sql.Date

class Curso implements Serializable {

    Long id
    Date dataInicial
    Date dataFinal
    String nomeCurso
    String cargaHoraria
    String instituicaoRealizadora
    String nomeServidor
    Long  matriculaServidor
    String nomeArquivo
    String tipoArquivo
    byte[] arqAssociado
    String idPessoa
    //CadastrarRemocao cadastrarRemocao
   // static transients = ['cadastrarRemocao']


    String toString(){
        nomeCurso
    }

    static constraints = {
        nomeCurso(blank: false, nullable: false)
        arqAssociado(maxSize:  20* 1024 * 1024, nullable: false, blank: false)
        cargaHoraria(nullable: false)

    }

    static mapping = {
        datasources(['lookup'])
    }
}
