package portalservidor

class BuscarVagas {

    String campus
    String nivel
    String cargo

    static constraints = {
    }

    static mapping = {
        datasource(['lookup'])
        table 'pegarVagas' //nome da view
        version false //desativar a coluna de versão
        id column:'id'
        campus column: 'campus'
        nivel column: 'nivel'
        cargo column: 'cargo'
    }

}
