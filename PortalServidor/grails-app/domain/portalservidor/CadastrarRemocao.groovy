package portalservidor

import java.sql.Date

class CadastrarRemocao implements Serializable {

    def idPessoa
    Long matriculaChefe
    String nomeChefe
    Long matriculaSubordinado
    Long idContrato
    String nomeSubordinado //nomeServidor
    String primeiraOpcao
    String segundaOpcao
    String email
    String nivel
    String outros , descricaoCurso
    Date dataExercicio
    String campus
    String cargo
    Float pontuacao
    Integer totalAnos
    static hasOne = [parecerChefia: ParecerChefia,parecerDiretor:ParecerDiretor,parecerRH:ParecerRH]
    static hasMany = [curso: Curso, formacaoAcademica: FormacaoAcademica]
    static transients = ['cursoCadastro','pegarParecer','PegarParecerDiretor','pontuacao','totalAnos','descricaoCurso', 'pegarParecer','pegarCurso', 'pegarJustificativa']




    static constraints = {
        nomeSubordinado(unique: true)
        email(email: true)
        primeiraOpcao(blank: false)
        parecerChefia(nullable: true)
        parecerDiretor(nullable: true)
        parecerRH(nullable: true)

    }
    static mapping = {
        datasources(['lookup'])
    }
    String toString(){
        nomeSubordinado
    }

    public Integer getPegarParecer() {
        def cadastroRemocao = CadastrarRemocao.findByNomeSubordinado(nomeSubordinado)
        def parecer = ParecerChefia.findAll("from ParecerChefia  as parecer where parecer.cadastrarRemocao = ?",[cadastroRemocao])
        return parecer.size()
    }
    public Integer getPegarParecerDiretor() {
        def cadastroRemocao = CadastrarRemocao.findByNomeSubordinado(nomeSubordinado)
        def parecerDiretor = ParecerDiretor.findAll("from ParecerDiretor  as parecerDiretor where parecerDiretor.cadastroRemocao = ?",[cadastroRemocao])
        print parecerDiretor
        return parecerDiretor.size()
    }

    public Integer getPegarParecerRH() {
        def cadastroRemocao = CadastrarRemocao.findByNomeSubordinado(nomeSubordinado)
        def parecerRH = ParecerRH.findAll("from ParecerRH  as parecerRH where parecerRH.cadastrarRemocao = ?",[cadastroRemocao])
        print parecerRH
        return parecerRH.size()
    }
    public String getPegarJustificativa() {
        def cadastroRemocao = CadastrarRemocao.findByNomeSubordinado(nomeSubordinado)
        def justificativa = ParecerRH.findAll("from ParecerRH as justificativa where justificativa.cadastrarRemocao = ?",[cadastroRemocao])
        print justificativa.justificativa
        return justificativa.justificativa
    }

    public String getPegarCurso() {
        def cadastroRemocao = CadastrarRemocao.findByNomeSubordinado(nomeSubordinado)
        def buscarCurso = ListeCurso.findAll("from ListeCurso as buscarCurso where buscarCurso.id= ?",[cadastroRemocao.idContrato])
        return buscarCurso.descricaoCurso


    }

    public String getCursoCadastro() {
        def cadastroRemocao = CadastrarRemocao.findByNomeSubordinado(nomeSubordinado)
        def pegarCurso =Curso.findAll("from Curso as pegarCurso where pegarCurso.matriculaServidor= ?",[cadastroRemocao.matriculaSubordinado])
        return pegarCurso.nomeCurso


    }




    public void getPegarParecerDiretor(Integer i) {}
}
