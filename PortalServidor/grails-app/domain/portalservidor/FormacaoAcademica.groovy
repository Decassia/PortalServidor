package portalservidor

import java.sql.Date

class FormacaoAcademica {
    Long id
    String tipoCurso
    String nomeCurso
    String cargaHoraria
    String instituicaoRealizadora
    String nomeArquivo
    String tipoArquivo
    byte[] arqAssociado
    String nomeServidor
    Long matriculaServidor
    String idPessoa

    //CadastrarRemocao cadastrarRemocao



    static constraints = {
        nomeCurso(nullable: false)
        tipoCurso(inList: ['Graduação','Especialização', 'Mestrado','Doutorado'],blank: false)
        arqAssociado(maxSize:  20* 1024 * 1024, nullable: false, blank: false)


    }

    static mapping = {
        datasource(['lookup'])
    }
}
