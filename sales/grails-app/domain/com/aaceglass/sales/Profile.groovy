package com.aaceglass.sales

class Profile {
	
	static belongsTo = SecUser

	String fullName
	String email
	String phoneNumber
	
    static constraints = {
		fullName(nullable: true)
		email(nullable: true)
		phoneNumber(nullable: true)
    }
	
	String toString() { return fullName }
}
