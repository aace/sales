import com.aaceglass.sales.*
import grails.util.Environment

class BootStrap {
	def springSecurityService

	def init = { servletContext ->

		switch (Environment.current) {

			case Environment.DEVELOPMENT:
				createAdminUserIfRequired()
				createTestingUsers()
				break;

			case Environment.PRODUCTION:
				createAdminUserIfRequired()
				if (!SecRole.findByAuthority("ROLE_SALES")) {
					def userRole = new SecRole(
							authority: "ROLE_SALES",
							description: "Sales Technician").save()
				}
				break;

		}

		//createAdminUserIfRequired()
		//createTestingUsers()		
	}


	def destroy = {
	}

	void createAdminUserIfRequired() {
		if (!SecUser.findByUsername("admin")) {
			println "Fresh Database. Creating ADMIN user."
			def user = new SecUser(
					fullName: "Administrator",
					email: "it-support@aaceglass.com",
					username: "admin",
					password: "admin",
					enabled: true).save()

			def role = SecRole.findByAuthority("ROLE_ADMIN")
			if (!role) {
				role =  new SecRole(authority: "ROLE_ADMIN", description: "Administrator").save()
			}
			
			SecUserSecRole.create(user, role)
		
			} else {
			println "Existing admin user, skipping creation"
		}
	}


	void createTestingUsers()  {

		def samples = [
					   'chuck_norris' : [ fullName: 'Chuck Norris'],
					   'jack' : [ fullName: 'Jack Salesman', email: 'jack@upthehill.local' ],
					   'jill' : [ fullName: 'Jill Saleswoman' ]
					   ]

		def userRole = new SecRole(authority: "ROLE_SALES", description: "Sales Technician").save()
 
		def now = new Date()

		if (!SecUser.list()) {
			samples.each { username, profileAttrs ->
				def user = new SecUser((profileAttrs),username: username, password: "demo", enabled: true)

				if (user.validate()) {
					println "Creating user ${username}..."
					//user.profile = new Profile(profileAttrs)
					user.save(flush:true)
					
					// Link the user to the SecRole.
					SecUserSecRole.create(user, userRole)
					
				} else {
					println("\n\n\nError in account bootstrap for ${username}!\n\n\n")
					user.errors.each {err ->
						println err
					}
				}
			}
			samples.each { username, profileAttrs ->
				println "Searching for user ${username}"
				def user = SecUser.findByUsername(username)
				println "User is ${user}"					
			}
		}
	}
}
