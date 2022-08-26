import org.springframework.security.core.userdetails.User

class MyUserDetails extends User {

    // extra instance variables final String fullname final String email final String title
    String fullname
    String gecos
    def idPessoa
    def uid


    MyUserDetails(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection authorities, String fullname, String gecos, idPessoa, uid) {

        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities)

        this.fullname = fullname
        this.idPessoa = idPessoa
        this.gecos = gecos
        this.idPessoa = idPessoa
        this.uid = uid



    }



}