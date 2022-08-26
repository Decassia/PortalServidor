package portalservidor

class BuscarMedia {
    String nomeServidor
    Long id
    Float media

    static constraints = {
    }

    static mapping = {
        datasource(['avaliacao'])
        table 'cadastro_remocao_media' //nome da view
        version false
        nomeServidor column: 'nome'
        id column: 'matricula'
        media column: 'media'

    }
}
