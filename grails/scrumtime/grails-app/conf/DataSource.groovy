dataSource {
	pooled = false
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
}
//dataSource {
//	pooled = false
//	driverClassName = "com.mysql.jdbc.Driver"
//	username = "root"
//	password = "root"
//}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='org.hibernate.cache.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
			url = "jdbc:hsqldb:mem:devDB"
		}
//		dataSource {
//			dbCreate = "create-drop" // one of 'create', 'create-drop','update'
//			url = "jdbc:mysql://localhost/scrumtime"
//		}
	}
	test {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/scrumtime-test"
		}
	}
	production {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost/scrumtime"
		}
	}
}