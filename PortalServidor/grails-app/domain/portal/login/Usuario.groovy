package portal.login

class Usuario {

	transient springSecurityService

	String username
	String password
    Long idPessoa
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
        datasource(['lookup'])
		password column: '`password`'
	}

	Set<Permissao> getAuthorities() {
		UsuarioPermissao.findAllByUsuario(this).collect { it.permissao } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
