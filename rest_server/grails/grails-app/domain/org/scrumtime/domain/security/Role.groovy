package org.scrumtime.domain.security

class Role {

	String authority

	static mapping = { cache true }

	static constraints = {
		authority blank: false, unique: true
	}
}
