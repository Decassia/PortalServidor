package portalservidor

class ParecerDiretor {

    String parecerDiretor
   // String emailRH
    static transients = ['campus']
    CadastrarRemocao  cadastroRemocao



    String toString (){
        parecerDiretor
    }

    static constraints = {
        parecerDiretor(inList: ['Concordo', 'Não Concordo'], blank: false)
        cadastroRemocao(unique: true)
       // emailRH(inList: ['rhpalmas@uft.edu.br', 'rhmiracema@uft.edu.br','rhportonacional@uft.edu.br','rharaguaina@uft.edu.br','rhgurupi@uft.edu.br', 'rharraias@uft.edu.br' ,'rhtocantinopolis@uft.edu.br','rh@uft.edu.br', 'decassia@uft.edu.br'])
    }

    static mapping = {
        datasource(['lookup'])
    }


}


