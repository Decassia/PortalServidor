package portalservidor
import java.sql.Date

import org.codehaus.groovy.runtime.StringGroovyMethods

class ListeCursoCapacitacao {

    Long id
    String nomeCurso
    def cargaHoraria
    String dataInicio
    String dataFim
    def numDias
    String tipoOrigem
    String instituicao


    static constraints = {
    }

    static mapping = {
        datasource(['DEFAULT'])

        table 'CadastrarRemocao_relacao' //nome da view
        version false //desativar a coluna de versão
        id column: 'id_contrato_rh'
        nomeCurso column: 'curso'
        cargaHoraria column: 'carga_horaria'
        dataInicio column: 'dt_incio'
        dataFim column: 'dt_termino'
        numDias column: 'num_dias'
        tipoOrigem column: 'tipo_origem'
        instituicao column: 'entidade_externa'

    }
}
