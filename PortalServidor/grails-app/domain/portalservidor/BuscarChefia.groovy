package portalservidor

class BuscarChefia implements Serializable {

    Long id
    Long matriculaChefe
    Long matriculaSubordinado
    String nomeChefe
    String nomeSubordinado



    static constraints = {
    }

    static mapping = {
        datasources(['DEFAULT'])
        table 'buscarchefia' //nome da view
        version false //desativar a coluna de versão
        id column:'id_uft_chefias_prov'
        nomeChefe column: 'nome_chefe'
        nomeSubordinado column: 'nome_subordinado'
        matriculaChefe column: 'mat_chefe'
        matriculaSubordinado column: 'mat_subordinado'
    }
}
