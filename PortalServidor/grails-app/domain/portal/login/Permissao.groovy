package portal.login

class Permissao {

	String authority

	static mapping = {
		cache true
        datasource(['lookup'])
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
