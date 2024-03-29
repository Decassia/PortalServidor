// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }




grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

// Validações do LDAP

grails.plugins.springsecurity.ldap.context.managerDn =''
grails.plugins.springsecurity.ldap.context.managerPassword = ''
grails.plugins.springsecurity.ldap.context.server = ''
grails.plugins.springsecurity.ldap.authorities.ignorePartialResultException = true
grails.plugins.springsecurity.ldap.search.base = ''
grails.plugins.springsecurity.ldap.search.filter = 'uid={0}'
grails.plugins.springsecurity.ldap.search.searchSubtree = true
grails.plugins.springsecurity.ldap.auth.hideUserNotFoundExceptions = false
//grails.plugins.springsecurity.ldap.search.attributesToReturn = ['uid', 'name', 'uid','idPessoa'] // extra attributes you want returned
//rails.plugins.springsecurity.ldap.authenticator.attributesToReturn = ['mail', 'name', 'uid','idPessoa']
grails.plugins.springsecurity.ldap.search.attributesToReturn = ['mail', 'cn', 'sn', 'uid','IDPessoa', 'gecos']
grails.plugins.springsecurity.ldap.authenticator.attributesToReturn = ['mail', 'cn', 'sn', 'uid','IDPessoa','gecos']
grails.plugins.springsecurity.providerNames = ['ldapAuthProvider', 'anonymousAuthenticationProvider']
grails.plugins.springsecurity.ldap.authorities.retrieveDatabaseRoles = true


// role-specific LDAP config
grails.plugins.springsecurity.ldap.useRememberMe = false
grails.plugins.springsecurity.ldap.authorities.retrieveGroupRoles = false
grails.plugins.springsecurity.ldap.authorities.groupSearchBase = ''
grails.plugins.springsecurity.ldap.authorities.groupSearchFilter = 'uid={0}'
//ldap.authorities. groupRoleAttribute =

// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'portal.login.Usuario'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'portal.login.UsuarioRegra'
grails.plugins.springsecurity.authority.className = 'portal.login.Regra'

//Reegras

import grails.plugins.springsecurity.SecurityConfigType
grails.plugins.springsecurity.securityConfigType = SecurityConfigType.InterceptUrlMap
grails.plugins.springsecurity.interceptUrlMap = [

     ///   '/index':['ROLE_USER'],
     //   '/cadastroServidor/list':['IS_AUTHENTICATED_FULLY '],
       // '/**':['IS_AUTHENTICATED_ANONYMOUSLY']

        '/logout/**':['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/login/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/j_spring_security_check/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/js/**':  ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/css/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/images/**': ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/usuario/*': ['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'],
        '/jasper/*': ['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'],
        '/cadastroServidor/list': ['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'],
        '/cadastrarRemocao/list': ['ROLE_ADMIN', 'IS_AUTHENTICATED_FULLY'],
     
        '/**': ['IS_AUTHENTICATED_REMEMBERED']

]



// sendMail configuration…



grails {
    mail {
        host = "smtp.gmail.com"
        port = 465
        username =  "naoresponderdti@gmail.com"
        password ="45F/#A(445F/#A(4"
        props = ["mail.smtp.auth":"true",
                "mail.smtp.socketFactory.port":"465",
                "mail.smtp.socketFactory.class":"javax.net.ssl.SSLSocketFactory",
                "mail.smtp.socketFactory.fallback":"false"]
    }
}
// Added by the Spring Security Core plugin:
grails.plugins.springsecurity.userLookup.userDomainClassName = 'portal.login.Usuario'
grails.plugins.springsecurity.userLookup.authorityJoinClassName = 'portal.login.UsuarioPermissao'
grails.plugins.springsecurity.authority.className = 'portal.login.Permissao'
