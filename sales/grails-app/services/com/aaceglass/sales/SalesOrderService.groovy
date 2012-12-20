package com.aaceglass.sales

class PostException extends RuntimeException {
	String message
	SalesOrder sale
}

class SalesOrderService {
	
	boolean transactional = true
	
	
	/* Method for REST and Remoting access.
	 * 
	 */
	long createSale(String username, 
					String custFirstName, 
					String custLastName, 
					String custBestNumber, 
					String custAlternateNumber,
					String custEmail,
					String custAddress,
					String custAddress2,
					String custCity,
					String custState,
					String custZip
					){
		def user = SecUser.findByUsername(username)
		if (!user) {
			throw new PostException(message: "User not found")
		}
		
		def sale = createSale(user.id, 
							  custFirstName,
							  custLastName,
							  custBestNumber,
							  custAlternateNumber,
							  custEmail,
							  custAddress,
							  custAddress2,
							  custCity,
							  custState,
							  custZip
							  )
		if (!sale) {
			throw new PostException(message: "Create failed: ${sale.errors}")
		}
		else {
			return sale.id
		}
	}

	/***
	 * Try to fetch sales for the current user
	 * @param username
	 * @param params
	 * @return
	 */
    def getUserSales(username, params) {
		
		if (!params.max)
			params.max = Math.min(params.max ? params.max.toInteger() : 10, 100)
		
		def user = SecUser.findByUsername(username)
		def saleCount = SalesOrder.countBySecUser(user)
		def sales = SalesOrder.findAllBySecUser(user, params)
		return [sales, saleCount]

    }
	
}
