/*dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
    username = "postgres"
    password = "1233"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://localhost:5432/GrailsTeste"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            pooled = true
            properties {
                maxActive = -1
                minEvictableIdleTimeMillis=1800000
                timeBetweenEvictionRunsMillis=1800000
                numTestsPerEvictionRun=3
                testOnBorrow=true
                testWhileIdle=true
                testOnReturn=true
                validationQuery="SELECT 1"
            }
        }
    }
}*/


dataSource {
    pooled = true

}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'

}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''


            driverClassName = "com.ibm.db2.jcc.DB2Driver"

        }

        dataSource_lookup{
            pooled = true
           // dialect = org.hibernate.dialect.MySQLInnoDBDialect
            driverClassName = 'com.mysql.jdbc.Driver'

            url = ''
            dbCreate = 'update'
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                initialSize = 5
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                maxWait = 10000
                validationQuery = "/* ping */"
            }

        }

        dataSource_avaliacao{
            pooled = true
            // dialect = org.hibernate.dialect.MySQLInnoDBDialect
            driverClassName = 'com.mysql.jdbc.Driver'
            username = ''
            password = 'y'
            url = ''
            dbCreate = 'update'
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                initialSize = 5
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                maxWait = 10000
                validationQuery = "/* ping */"
            }

        }


    }
    test {

        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''

            driverClassName = "com.ibm.db2.jcc.DB2Driver"
            username = ""
            password = ""
        }

        dataSource_lookup{
            pooled = true
            // dialect = org.hibernate.dialect.MySQLInnoDBDialect
            driverClassName = 'com.mysql.jdbc.Driver'
            username = ''
            password = ''
            url = ''
            dbCreate = 'update'
            properties {
                maxActive = 50
                maxIdle = 25
                minIdle = 5
                initialSize = 5
                minEvictableIdleTimeMillis = 60000
                timeBetweenEvictionRunsMillis = 60000
                maxWait = 10000
                validationQuery = "/* ping */"
            }

        }
    }
    production {

            dataSource {
                dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
                url = ""

                driverClassName = "com.ibm.db2.jcc.DB2Driver"
                username = ""
                password = ""
            }

            dataSource_lookup{
                pooled = true
                // dialect = org.hibernate.dialect.MySQLInnoDBDialect
                driverClassName = 'com.mysql.jdbc.Driver'
                username = ''
                password = ''
                url = ''
                dbCreate = 'update'
                properties {
                    maxActive = 50
                    maxIdle = 25
                    minIdle = 5
                    initialSize = 5
                    minEvictableIdleTimeMillis = 60000
                    timeBetweenEvictionRunsMillis = 60000
                    maxWait = 10000
                    validationQuery = "/* ping */"
                }

            }
    }

}
