

import org.springframework.ldap.core.DirContextAdapter
import org.springframework.ldap.core.DirContextOperations
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.ldap.userdetails.UserDetailsContextMapper

class MyUserDetailsContextMapper implements UserDetailsContextMapper {

    UserDetails mapUserFromContext(DirContextOperations ctx, String username, Collection authorities) {

        String fullname = ctx.originalAttrs.attrs['cn'].values[0]
        String gecos = ctx.originalAttrs.attrs['gecos'].values[0]
        def idPessoa =  ctx.getObjectAttribute('IDPessoa')
        def uid = ctx.getObjectAttribute('uid')
        println(idPessoa)


         def userDetails = new MyUserDetails(username, '', true, true, true, true, authorities, fullname, gecos,idPessoa,uid)
         println(userDetails)
         return userDetails
    }

    void mapUserToContext(UserDetails user, DirContextAdapter ctx) {
        throw new IllegalStateException("Only retrieving data from LDAP is currently supported")
    }

}



