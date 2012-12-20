package com.aaceglass.sales

import java.util.Date;

class SecUser {

	transient springSecurityService
	String fullName
	String phoneNumber
	String email
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	Date dateCreated
	
	static hasMany = [salesOrders : SalesOrder]

	static constraints = {
		fullName blank: false, unique: true
		email email: true, nullable: true
		phoneNumber nullable: true
		username blank: false, unique: true
		password blank: false
		dateCreated()
		
	}

	static mapping = {
		password column: '`password`'
	}

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this).collect { it.secRole } as Set
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
	
	String toString() { return username }
}
