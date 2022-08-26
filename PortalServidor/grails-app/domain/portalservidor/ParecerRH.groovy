package portalservidor

class ParecerRH {
    String parecerRH
    CadastrarRemocao cadastrarRemocao
    String justificativa
//   String nomeServidor, descricaoCurso,descricaoEspec,descricaoFormacao, cargahoraria
   // static transients = ['nomeServidor','descricaoCurso','descricaoEspec','descricaoFormacao', 'cargahoraria']

    static constraints = {
        parecerRH(inList: ['Atende à necessidade do Campus','Não atende à necessidade do Campus'], blank: false)
        justificativa(maxSize: 100)
        cadastrarRemocao(unique: true)

    }

    static mapping = {
        datasource(['lookup'])
    }

     String toString(){
         parecerRH

    }
}
