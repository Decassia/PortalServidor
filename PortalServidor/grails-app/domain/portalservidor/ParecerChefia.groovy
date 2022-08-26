package portalservidor

class ParecerChefia {
    String outroServidor
    String parecerChefiaMediato
    String emailChefiaMediato
    CadastrarRemocao cadastrarRemocao
    String emailReitoria






    static constraints = {
        outroServidor(inList: ['Sim', 'Não'], blank: false)
        parecerChefiaMediato(inList: ['Concordo', 'Não Concordo'], blank: false)
        emailChefiaMediato(inList: ['dirportonacional@uft.edu.br', 'dirmiracema@uft.edu.br', 'dirarraias@uft.edu.br', 'dirpalmas@uft.edu.br', 'diraraguaina@uft.edu.br','dirgurupi@uft.edu.br','decassia@uft.edu.br'], nullable: true)
        cadastrarRemocao(unique: true)
    }

   static mapping = {
       datasource(['lookup'])
   }

    String toString(){
        parecerChefiaMediato
    }


}
