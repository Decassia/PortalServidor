package portalservidor

class ListeCurso implements Serializable {

    Long id
    String descricaoCurso
    String descricaoEspec


    static constraints = {
        id()
        descricaoCurso()
        descricaoEspec()

    }

    static mapping = {
        datasources(['DEFAULT'])
        table 'listarcurso' //nome da view
        version false //desativar a coluna de versão
        id composite: ['id','descricaoCurso']
        id column: 'id_contrato_rh'
        descricaoCurso column:'desccurso'
        descricaoEspec column: 'descespec'


    }

}
