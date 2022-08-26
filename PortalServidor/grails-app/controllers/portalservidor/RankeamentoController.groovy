package portalservidor

import org.springframework.dao.DataIntegrityViolationException

class RankeamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {


    }
//Araguaina
   def araguaina() {

        def  remocao = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Araguaína")

        }
        for(r in remocao){



            r.pontuacao= 0// Nota do remoção interna
            // r.pontuacao = r.pontuacao + 5


            def x = r.idContrato
            def y = r.matriculaSubordinado
            def media = BuscarMedia.findById(y)
            if (media.media >= 7 && media.media <= 7.99){
                r.pontuacao = r.pontuacao + 5
            }
            if (media.media >= 8 && media.media <= 8.99){
                r.pontuacao = r.pontuacao + 7
            }
            if (media.media >= 9 && media.media <= 10){
                print 'entrou aqui Araguaina'
                r.pontuacao = r.pontuacao + 10
                print r.pontuacao
            }



            if (r.nivel=="C"){
                print x
                def curso = ListeCurso.findById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
               else{
                   for (c in curso){
                        if (c.descricaoCurso.equals('Ensino Médio')){

                            r.pontuacao += 0.5
                        }
                        if (c.descricaoCurso.equals('Graduação')){
                            print "Araguaina"
                            r.pontuacao += 1
                        }

                        if (c.descricaoCurso.equals('Especialização')){
                            print "Araguaina"
                            r.pontuacao += 1.5
                        }
                        if (c.descricaoCurso.equals('Mestrado')){
                            print "Araguaina"
                            r.pontuacao += 3
                        }
                        if (c.descricaoCurso.equals('Doutorado')){
                            print "Araguaina"
                            r.pontuacao += 4
                        }

                  }
               }
                def total = r.pontuacao
                print total
            }
            if(r.nivel == "D"){
                print 'Nível D entrou aqui'
                def curso = ListeCurso.findById(x)

                if (curso == null){
                    //def escolaridade = BuscarServidor.findById(x)
                    r.pontuacao += 0
                    print 'Conseguimos!'

                }
               else{

                 for (c in curso){

                        if (c.descricaoCurso.equals('Graduação')){
                            print "Araguaina"
                            r.pontuacao += 1
                        }
                        if (c.descricaoCurso.equals('Especialização')){
                            print "Araguaina"
                            r.pontuacao += 2
                        }
                        if (c.descricaoCurso.equals('Mestrado')){
                            print "Araguaina"
                            r.pontuacao += 3
                        }
                        if (c.descricaoCurso.equals('Doutorado')){
                            print "Doutorado"
                            r.pontuacao += 4
                        }
                 }

                    def total = r.pontuacao
                    print total
                }
          }
            if(r.nivel == "E"){
                def curso = ListeCurso.findById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{
                 for(c in curso){
                        if (c.descricaoCurso == 'Especialização'){
                            print "Aqui"
                            r.pontuacao += 2
                        }
                        if (c.descricaoCurso == 'Mestrado'){
                            print "Aqui"
                            r.pontuacao += 3
                        }
                        if (c.descricaoCurso == 'Doutorado'){
                            print "Aqui"
                            r.pontuacao += 5
                        }
                    }
                }
            }
            def dataExercicio = r.dataExercicio
            long data = new Date().time - dataExercicio.time
            data = data / 1000 / 60 / 60 / 24
            def totalAnos = (data/365).toInteger()
            r.totalAnos = totalAnos
            println(r.totalAnos)
            if (r.totalAnos > 1){
                r.pontuacao = r.pontuacao + 10.0
                print r.pontuacao
            }



     /* Collections.sort(remocao, new Comparator<CadastrarRemocao>(){

           int compare(CadastrarRemocao o1, CadastrarRemocao o2) {
               return Float.compare(o1.pontuacao > o2.pontuacao ? -1 : (o1.pontuacao == o2.pontuacao ? 0 : 1));
           }
       }); */

        }
       [remocao: remocao]
 }

 //Palmas
    def palmas() {

        def  remocao = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Palmas")

        }
        for(r in remocao){

            r.pontuacao= 0
            def x = r.idContrato
            def y = r.matriculaSubordinado
            print x
            def media = BuscarMedia.findById(y)
            print  media.media


            if (media.media >= 7 && media.media <= 7.99){
                r.pontuacao = r.pontuacao + 5
            }
            if (media.media >= 8 && media.media <= 8.99){
                r.pontuacao = r.pontuacao + 7
            }
            if (media.media >= 9 && media.media <= 10){
                r.pontuacao = r.pontuacao + 10
            }


            if (r.nivel=="C"){
                def curso = ListeCurso.findAllById(x)

               if (curso == null){
                   r.pontuacao = r.pontuacao + 0
               }
               else{
                  for (c in curso){
                    if (c.descricaoCurso.equals('Ensino Médio')){
                        print "Palmas"
                        r.pontuacao += 0.5
                    }
                    if (c.descricaoCurso.equals('Graduação')){
                        print "Palmas"
                        r.pontuacao += 1
                    }

                    if (c.descricaoCurso.equals('Especialização')){

                        r.pontuacao += 1.5
                    }
                    if (c.descricaoCurso.equals('Mestrado')){
                        r.pontuacao += 3
                    }
                    if (c.descricaoCurso.equals('Doutorado')){
                        r.pontuacao += 4
                    }
               }
             }
                    def total = r.pontuacao
                    print total
            }
            if(r.nivel == "D"){
                print 'Nível D entrou aqui'
                def curso = ListeCurso.findAllById(x)
                print curso.descricaoCurso
                print curso.descricaoEspec

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                  //  print 'Não é nulo'
                }
                else{

                   print 'Não eh nulo'
                  for(c in curso){

                    if (c.descricaoCurso == 'Graduação'){
                        print "Palmas"
                        r.pontuacao += 1
                    }
                    if (c.descricaoCurso == 'Especialização'){

                        r.pontuacao += 2
                    }
                    if (c.descricaoCurso == 'Mestrado'){
                        print "Palmas"
                        r.pontuacao += 3
                    }
                    if (c.descricaoCurso == 'Doutorado'){
                        print "Palmas"
                        r.pontuacao += 4
                    }
                  }

                def total = r.pontuacao
                print total
            }
        }
            if(r.nivel == "E"){
                print r.nivel
                def curso = ListeCurso.findById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{
                  for (c in curso){
                    if (c.descricaoCurso == 'Especialização'){
                        print "Especialização E"
                        r.pontuacao = r.pontuacao + 2
                    }
                    if (c.descricaoCurso == 'Mestrado'){
                        print "Aqui Mestrado "
                        r.pontuacao = r.pontuacao + 3
                    }
                    if (c.descricaoCurso == 'Doutorado'){
                        print "Aqui Doutorado"
                        r.pontuacao = r.pontuacao + 5
                    }
                  }
                }
            }
           def dataExercicio = r.dataExercicio
            long data = new Date().time - dataExercicio.time
            data = data / 1000 / 60 / 60 / 24
            def totalAnos = (data/365).toInteger()
            r.totalAnos = totalAnos
            println(r.totalAnos)
            if (r.totalAnos > 1){
                r.pontuacao = r.pontuacao + 10.0
                print r.pontuacao
            }





        }

                 [remocao: remocao]

    }
//Porto Nacional
    def porto() {

        def  remocao = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Porto Nacional")

        }
        for(r in remocao){

            r.pontuacao= 0
            // r.pontuacao = r.pontuacao + 5

            def x = r.idContrato
            def y = r.matriculaSubordinado
            print x
            def media = BuscarMedia.findById(y)
            print  media.media


            if (media.media >= 7 && media.media <= 7.99){
                r.pontuacao = r.pontuacao + 5
            }
            if (media.media >= 8 && media.media <= 8.99){
                r.pontuacao = r.pontuacao + 7
            }
            if (media.media >= 9 && media.media <= 10){
                r.pontuacao = r.pontuacao + 10
            }


            if (r.nivel=="C"){
                def curso = ListeCurso.findAllById(x)
                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{
                 for (c in curso){
                    if (c.descricaoCurso.equals('Ensino Médio')){

                        r.pontuacao += 0.5
                    }
                    if (c.descricaoCurso.equals('Graduação')){

                        r.pontuacao += 1
                    }

                    if (c.descricaoCurso.equals('Especialização')){

                        r.pontuacao += 1.5
                    }
                    if (c.descricaoCurso.equals('Mestrado')){
                        r.pontuacao += 3
                    }
                    if (c.descricaoCurso.equals('Doutorado')){
                        r.pontuacao += 4
                    }
                 }
                }

                def total = r.pontuacao
                print total
            }
            if(r.nivel == "D"){

                def curso = ListeCurso.findAllById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                    print 'entrou aqui'
                }
                else{

                 for (c in curso){

                    if (c.descricaoCurso.equals('Graduação')){
                        print "Palmas"
                        r.pontuacao += 1
                    }
                    if (c.descricaoCurso == 'Especialização'){
                        print "porto nacional"
                        r.pontuacao = r.pontuacao + 2
                    }
                    if (c.descricaoCurso.equals('Mestrado')){
                        print "Palmas"
                        r.pontuacao = r.pontuacao + 3
                    }
                    if (c.descricaoCurso.equals('Doutorado')){
                        print "Palmas"
                        r.pontuacao += 4
                    }

                    def total = r.pontuacao
                    print total
                }
            }
          }
            if(r.nivel == "E"){
                print r.nivel
                def curso = ListeCurso.findAllById(x)


                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{
                    for (c in curso){


                    if (c.descricaoCurso == 'Especialização'){
                        print "Especialização E"
                        r.pontuacao = r.pontuacao + 2
                    }
                    if (c.descricaoCurso == 'Mestrado'){
                        print "Aqui Mestrado "
                        r.pontuacao = r.pontuacao + 3
                    }
                    if (c.descricaoCurso == 'Doutorado'){
                        print "Aqui Doutorado"
                        r.pontuacao = r.pontuacao + 5
                    }
                }
             }
            }
            def dataExercicio = r.dataExercicio
            long data = new Date().time - dataExercicio.time
            data = data / 1000 / 60 / 60 / 24
            def totalAnos = (data/365).toInteger()
            r.totalAnos = totalAnos
            println(r.totalAnos)
            if (r.totalAnos > 1){
                r.pontuacao = r.pontuacao + 10.0
                print r.pontuacao
            }




        }





        [remocao: remocao]


    }

   //Miracema
    def miracema() {

        def  remocao = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Miracema")

        }
        for(r in remocao){

            r.pontuacao= 0

            def x = r.idContrato
            def y = r.matriculaSubordinado
            print x
            def media = BuscarMedia.findById(y)
            print  media.media


            if (media.media >= 7 && media.media <= 7.99){
                r.pontuacao = r.pontuacao + 5
            }
            if (media.media >= 8 && media.media <= 8.99){
                r.pontuacao = r.pontuacao + 7
            }
            if (media.media >= 9 && media.media <= 10){
                r.pontuacao = r.pontuacao + 10
            }


            if (r.nivel=="C"){
                def curso = ListeCurso.findAllById(x)
                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{

                    for (c in curso){
                        if (c.descricaoCurso.equals('Ensino Médio')){

                            r.pontuacao += 0.5
                        }
                        if (c.descricaoCurso.equals('Graduação')){

                            r.pontuacao += 1
                        }

                        if (c.descricaoCurso.equals('Especialização')){

                            r.pontuacao += 1.5
                        }
                        if (c.descricaoCurso.equals('Mestrado')){
                            r.pontuacao += 3
                        }
                        if (c.descricaoCurso.equals('Doutorado')){
                            r.pontuacao += 4
                        }
                    }
                }

                def total = r.pontuacao
                print total
            }
            if(r.nivel == "D"){
                def curso = ListeCurso.findAllById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{

                  for (c in curso){

                    if (c.descricaoCurso.equals('Graduação')){

                        r.pontuacao += 1
                    }
                    if (c.descricaoCurso.equals('Especialização')){
                        print "Palmas"
                        r.pontuacao += 2
                    }
                    if (c.descricaoCurso.equals('Mestrado')){
                        print "Palmas"
                        r.pontuacao += 3
                    }
                    if (c.descricaoCurso.equals('Doutorado')){
                        print "Palmas"
                        r.pontuacao += 4
                    }

                    def total = r.pontuacao
                    print total
                }
             }
           }

            if(r.nivel == "E"){
                print r.nivel
                def curso = ListeCurso.findById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{

                  for (c in curso){

                    if (c.descricaoCurso == 'Especialização'){
                        print "Especialização E"
                        r.pontuacao = r.pontuacao + 2
                    }
                    if (c.descricaoCurso == 'Mestrado'){
                        print "Aqui Mestrado "
                        r.pontuacao = r.pontuacao + 3
                    }
                    if (c.descricaoCurso == 'Doutorado'){
                        print "Aqui Doutorado"
                        r.pontuacao = r.pontuacao + 5
                    }
                  }
               }
            }
            def dataExercicio = r.dataExercicio
            long data = new Date().time - dataExercicio.time
            data = data / 1000 / 60 / 60 / 24
            def totalAnos = (data/365).toInteger()
            r.totalAnos = totalAnos
            println(r.totalAnos)
            if (r.totalAnos > 1){
                r.pontuacao = r.pontuacao + 10.0
                print r.pontuacao
            }




        }





        [remocao: remocao]


    }
  //tocantinopolis
    def tocantinopolis() {

        def  remocao = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Tocantinópolis")

        }
        for(r in remocao){
            r.pontuacao= 0

            def x = r.idContrato
            def y = r.matriculaSubordinado
            print x
            def media = BuscarMedia.findById(y)
            print  media.media


            if (media.media >= 7 && media.media <= 7.99){
                r.pontuacao = r.pontuacao + 5
            }
            if (media.media >= 8 && media.media <= 8.99){
                r.pontuacao = r.pontuacao + 7
            }
            if (media.media >= 9 && media.media <= 10){
                r.pontuacao = r.pontuacao + 10
            }

            if (r.nivel=="C"){
                def curso = ListeCurso.findAllById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{

                    for (c in curso){
                        if (c.descricaoCurso.equals('Ensino Médio')){

                            r.pontuacao += 0.5
                        }
                        if (c.descricaoCurso.equals('Graduação')){

                            r.pontuacao += 1
                        }

                        if (c.descricaoCurso.equals('Especialização')){

                            r.pontuacao += 1.5
                        }
                        if (c.descricaoCurso.equals('Mestrado')){
                            r.pontuacao += 3
                        }
                        if (c.descricaoCurso.equals('Doutorado')){
                            r.pontuacao += 4
                        }
                    }
                }


                def total = r.pontuacao
                print total
            }
            if(r.nivel == "D"){
                def curso = ListeCurso.findAllById(x)
                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{

                  for (c in curso){
                    if (c.descricaoCurso.equals('Graduação')){
                        print "Palmas"
                        r.pontuacao += 1
                    }
                    if (c.descricaoCurso.equals('Especialização')){
                        print "Palmas"
                        r.pontuacao += 2
                    }
                    if (c.descricaoCurso.equals('Mestrado')){
                        print "Palmas"
                        r.pontuacao += 3
                    }
                    if (c.descricaoCurso.equals('Doutorado')){
                        print "Palmas"
                        r.pontuacao += 4
                    }
                  }
                }
                def total = r.pontuacao
                print total
            }

            if(r.nivel == "E"){
                print r.nivel
                def curso = ListeCurso.findById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{

                  for (c in curso){

                        if (c.descricaoCurso == 'Especialização'){
                            print "Especialização E"
                            r.pontuacao = r.pontuacao + 2
                        }
                        if (c.descricaoCurso == 'Mestrado'){
                            print "Aqui Mestrado "
                            r.pontuacao = r.pontuacao + 3
                        }
                        if (c.descricaoCurso == 'Doutorado'){
                            print "Aqui Doutorado"
                            r.pontuacao = r.pontuacao + 5
                        }
                  }
                }
            }
            def dataExercicio = r.dataExercicio
            long data = new Date().time - dataExercicio.time
            data = data / 1000 / 60 / 60 / 24
            def totalAnos = (data/365).toInteger()
            r.totalAnos = totalAnos
            println(r.totalAnos)
            if (r.totalAnos > 1){
                r.pontuacao = r.pontuacao + 10.0
                print r.pontuacao
            }




        }





        [remocao: remocao]


    }
  //arraias
    def arraias() {

        def  remocao = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Arraias")

        }
        for(r in remocao){
            r.pontuacao= 0
            def x = r.idContrato
            def y = r.matriculaSubordinado
            print x
            def media = BuscarMedia.findById(y)
            print  media.media


            if (media.media >= 7 && media.media <= 7.99){
                r.pontuacao = r.pontuacao + 5
            }
            if (media.media >= 8 && media.media <= 8.99){
                r.pontuacao = r.pontuacao + 7
            }
            if (media.media >= 9 && media.media <= 10){
                r.pontuacao = r.pontuacao + 10
            }



            if (r.nivel=="C"){
                def curso = ListeCurso.findAllById(x)
                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{
                  for (c in curso){

                        if (c.descricaoCurso.equals('Ensino Médio')){
                            print "Palmas"
                            r.pontuacao += 0.5
                        }
                        if (c.descricaoCurso.equals('Graduação')){
                            print "Palmas"
                            r.pontuacao += 1
                        }

                        if (c.descricaoCurso.equals('Especialização')){

                            r.pontuacao += 1.5
                        }
                        if (c.descricaoCurso.equals('Mestrado')){
                            r.pontuacao += 3
                        }
                        if (c.descricaoCurso.equals('Doutorado')){
                            r.pontuacao += 4
                        }

                  }
                }
                def total = r.pontuacao
                print total
            }
            if(r.nivel == "D"){
                def curso = ListeCurso.findAllById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{
                    for (c in curso){
                        if (c.descricaoCurso.equals('Graduação')){
                            print "Palmas"
                            r.pontuacao += 1
                        }
                        if (c.descricaoCurso.equals('Especialização')){
                            print "Palmas"
                            r.pontuacao += 2
                        }
                        if (c.descricaoCurso.equals('Mestrado')){
                            print "Palmas"
                            r.pontuacao += 3
                        }
                        if (c.descricaoCurso.equals('Doutorado')){
                            print "Palmas"
                            r.pontuacao += 4
                        }
                    }
                }
                def total = r.pontuacao
                print total
            }
            if(r.nivel == "E"){
                print r.nivel
                def curso = ListeCurso.findById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{
                  for (c in curso){
                    if (c.descricaoCurso == 'Especialização'){
                        print "Especialização E"
                        r.pontuacao = r.pontuacao + 2
                    }
                    if (c.descricaoCurso == 'Mestrado'){
                        print "Aqui Mestrado "
                        r.pontuacao = r.pontuacao + 3
                    }
                    if (c.descricaoCurso == 'Doutorado'){
                        print "Aqui Doutorado"
                        r.pontuacao = r.pontuacao + 5
                    }

                  }
                }
            }
            def dataExercicio = r.dataExercicio
            long data = new Date().time - dataExercicio.time
            data = data / 1000 / 60 / 60 / 24
            def totalAnos = (data/365).toInteger()
            r.totalAnos = totalAnos
            println(r.totalAnos)
            if (r.totalAnos > 1){
                r.pontuacao = r.pontuacao + 10.0
                print r.pontuacao
            }




        }


        [remocao: remocao]


    }

    def reitoria() {

        def  remocao = CadastrarRemocao.createCriteria().list {
            eq("primeiraOpcao" ,"Reitoria")

        }


        for(r in remocao){
            r.pontuacao= 0
            def x = r.idContrato
            def y = r.matriculaSubordinado
            print x
            def media = BuscarMedia.findById(y)
            print  media.media
            r.pontuacao = 0

            if (media.media >= 7 && media.media <= 7.99){
                r.pontuacao = r.pontuacao + 5
            }
            if (media.media >= 8 && media.media <= 8.99){
                r.pontuacao = r.pontuacao + 7
            }
            if (media.media >= 9 && media.media <= 9.99){
                print 'entrou aqui!'
                r.pontuacao = r.pontuacao + 10
                print r.pontuacao
            }




            if (r.nivel=="C"){
                def curso = ListeCurso.findAllById(x)
                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{
                   for (c in curso){

                        if (c.descricaoCurso.equals('Ensino Médio')){

                            r.pontuacao += 0.5
                        }
                        if (c.descricaoCurso.equals('Graduação')){

                            r.pontuacao += 1
                        }

                        if (c.descricaoCurso.equals('Especialização')){

                            r.pontuacao += 1.5
                        }
                        if (c.descricaoCurso.equals('Mestrado')){
                            r.pontuacao += 3
                        }
                        if (c.descricaoCurso.equals('Doutorado')){
                            r.pontuacao += 4
                        }
                   }
                }
                def total = r.pontuacao
                print total
            }
            if(r.nivel == "D"){
                def curso = ListeCurso.findAllById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{
                    for (c in curso){
                        if (c.descricaoCurso.equals('Graduação')){

                            r.pontuacao += 1
                        }
                        if (c.descricaoCurso.equals('Especialização')){

                            r.pontuacao += 2
                        }
                        if (c.descricaoCurso.equals('Mestrado')){

                            r.pontuacao += 3
                        }
                        if (c.descricaoCurso.equals('Doutorado')){

                            r.pontuacao += 4
                        }
                    }
                }
                def total = r.pontuacao
                print total
            }
            if(r.nivel == "E"){
                print r.nivel
                def curso = ListeCurso.findById(x)

                if (curso == null){
                    r.pontuacao = r.pontuacao + 0
                }
                else{
                    for (c in curso){
                        if (c.descricaoCurso == 'Especialização'){
                            print "Especialização E"
                            r.pontuacao = r.pontuacao + 2
                        }
                        if (c.descricaoCurso == 'Mestrado'){
                            print "Aqui Mestrado "
                            r.pontuacao = r.pontuacao + 3
                        }
                        if (c.descricaoCurso == 'Doutorado'){
                            print "Aqui Doutorado"
                            r.pontuacao = r.pontuacao + 5
                        }

                    }
                }
            }
            def dataExercicio = r.dataExercicio
            long data = new Date().time - dataExercicio.time
            data = data / 1000 / 60 / 60 / 24
            def totalAnos = (data/365).toInteger()
            r.totalAnos = totalAnos
            println(r.totalAnos)
            if (r.totalAnos > 1){
                r.pontuacao = r.pontuacao + 10.0
                print r.pontuacao
            }




        }


        [remocao: remocao]


    }









}
