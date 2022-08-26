import portal.login.Permissao
import portal.login.*

class BootStrap {

    def springSecurityService
    def init = { servletContext ->
        def userRole = Permissao.findByAuthority('ROLE_USER') ?: new
        Permissao(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = Permissao.findByAuthority('ROLE_ADMIN') ?: new
        Permissao(authority: 'ROLE_ADMIN').save(failOnError: true)
        def adminUser = Usuario.findByUsername('Celia Mitie Kondo') ?: new Usuario(
                username: 'Celia Mitie Kondo',
                password:
                        springSecurityService.encodePassword('Celia Mitie Kondo'),
                permissao: adminRole,
                enabled: true).save(failOnError: true)
       // if (!adminUser.authorities.contains(adminRole)) {
         //    UsuarioPermissao.create adminUser, adminRole
        //}
    }
    def destroy = {
    }


}
