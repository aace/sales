package com.aaceglass.sales

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import grails.converters.*


class SalesOrderController {
	
	def springSecurityService

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	@Secured(['ROLE_SALES', 'ROLE_ADMIN'])
	def index() {
		redirect(action: "iq", params: params)
	}
//FIXME: Fix pagination params  SalesOrder.withCriteria 	
	@Secured(['ROLE_SALES', 'ROLE_ADMIN'])
    def all(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def authenticatedUser = springSecurityService.currentUser
		def salesOrders = []
		if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
			salesOrders = SalesOrder.list(params)
		} else {
			salesOrders = SalesOrder.withCriteria {
													secUser { eq 'id', springSecurityService.currentUser.id }  
											      } 
		}
		return [salesOrderInstanceList: salesOrders, salesOrderInstanceTotal: salesOrders.size()]
        //redirect(action: "list", params: params)
    }
	
	@Secured(['ROLE_SALES', 'ROLE_ADMIN'])
	def iq(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def authenticatedUser = springSecurityService.currentUser
		def salesOrders = []
		if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
			salesOrders = SalesOrder.findAllByOrderStatus("In Queue",[sort: "installDate", order: "asc"])
		} else {
			salesOrders = SalesOrder.withCriteria { like ('orderStatus','In Queue')
													secUser { eq 'id', springSecurityService.currentUser.id }
												  }
		}
		
		return [salesOrderInstanceList: salesOrders, salesOrderInstanceTotal: salesOrders.size()]
		//redirect(action: "list", params: params)
	}
	
	@Secured(['ROLE_SALES', 'ROLE_ADMIN'])
	def pr(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def authenticatedUser = springSecurityService.currentUser
		def salesOrders = []
		if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
			salesOrders = SalesOrder.findAllByOrderStatus("Processed", [sort: "installDate", order: "asc"])
		} else {
			salesOrders = SalesOrder.withCriteria { like ('orderStatus','Processed')
													secUser { eq 'id', springSecurityService.currentUser.id }
												  }
		}
		return [salesOrderInstanceList: salesOrders, salesOrderInstanceTotal: salesOrders.size()]
		//redirect(action: "list", params: params)
	}
	
	@Secured(['ROLE_SALES', 'ROLE_ADMIN'])
	def cp(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def authenticatedUser = springSecurityService.currentUser
		def salesOrders = []
		if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
			salesOrders = SalesOrder.findAllByOrderStatus("Completed", [sort: "installDate", order: "asc"])
		} else {
			salesOrders = SalesOrder.withCriteria { like ('orderStatus','Completed')
													secUser { eq 'id', springSecurityService.currentUser.id }
												  }
		}
		return [salesOrderInstanceList: salesOrders, salesOrderInstanceTotal: salesOrders.size()]
		//redirect(action: "list", params: params)
	}
	
  //  @Secured(['IS_AUTHENTICATED_REMEMBERED'])
  //  def list(Integer max) {
  //      params.max = Math.min(max ?: 10, 100)
  //      [salesOrderInstanceList: SalesOrder.list(params), salesOrderInstanceTotal: SalesOrder.count()]
  //  }
	/***
	 * Here is where we list the Sales Orders. Determine the user and role, then fetch records accordingly.
	 * @param max
	 * @return
	 */
	@Secured(['ROLE_SALES', 'ROLE_ADMIN'])
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
	   def authenticatedUser = springSecurityService.currentUser
	   def authenticatedUserId = springSecurityService.currentUser.id
	   log.info "Fetched autheticated username: ${authenticatedUser}"
	   def salesOrders = []
	   if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
		   log.info "Entered ADMIN list"
		   salesOrders = SalesOrder.list(params)
	   }else{
		   salesOrders = SalesOrder.withCriteria { secUser { eq 'id', springSecurityService.currentUser.id }}
		   log.info "Fetching SalesOrders for ${authenticatedUser}"
		   log.info "user id: ${springSecurityService.currentUser.id}"
	   }
	   [salesOrderInstanceList: salesOrders, salesOrderInstanceTotal: salesOrders.size()]
	}
	
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
    def create() {
        [salesOrderInstance: new SalesOrder(params)]
    }

 //   def save() {
 //       def salesOrderInstance = new SalesOrder(params)
 //       if (!salesOrderInstance.save(flush: true)) {
 //           render(view: "create", model: [salesOrderInstance: salesOrderInstance])
 //           return
 //       }
		
	@Secured(['IS_AUTHENTICATED_REMEMBERED'])
	def save() {
	
	   def authenticatedUser = SecUser.findByUsername(springSecurityService.principal.username)
	   def salesOrderInstance = new SalesOrder(params)
	          if (!salesOrderInstance.save(flush: true)) {
	              render(view: "create", model: [salesOrderInstance: salesOrderInstance])
	              return
	         }
	   // this assumes you're SecUser and SalesOrder are a 1-to-many bidirectional association
	   authenticatedUser.addToSalesOrders(salesOrderInstance)
	   flash.message = message(code: 'default.created.message', args: [message(code: 'salesOrder.label', default: 'Sales Order'), salesOrderInstance.id])
	   authenticatedUser.save(failOnError: true)
       redirect(action: "list")
    }
	
	//TODO: Improve security to prevent non-admins to view non-owned records
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED','ROLE_ADMIN','ROLE_SALES'])
    def show(Long id) {
		def salesOrderInstance = []
		if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {			
			salesOrderInstance = SalesOrder.get(id)
		} else {
			def authenticatedUser = SecUser.findByUsername(springSecurityService.principal.username)
			def salesOrder = SalesOrder.withCriteria { secUser { eq 'id', springSecurityService.currentUser.id }}
			salesOrderInstance = SalesOrder.get(id)
		}
		if (!salesOrderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salesOrder.label', default: 'Sales   Order'), id])
            redirect(action: "list")
            return
        }

        [salesOrderInstance: salesOrderInstance]
    }
	
//TODO: Improve security to prevent edits of non-owned records by non-admins
	
	@Secured(['IS_AUTHENTICATED_REMEMBERED','ROLE_ADMIN','ROLE_SALES'])
    def edit(Long id) {
    //    def salesOrderInstance = SalesOrder.get(id)
    //   if (!salesOrderInstance) {
    //        flash.message = message(code: 'default.not.found.message', args: [message(code: 'salesOrder.label', default: 'SalesOrder'), id])
    //        redirect(action: "list")
    //        return
		def salesOrderInstance = []
		if (SpringSecurityUtils.ifAnyGranted('ROLE_ADMIN')) {
			salesOrderInstance = SalesOrder.get(id)
		} else {
			def authenticatedUser = SecUser.findByUsername(springSecurityService.principal.username)
			def salesOrder = SalesOrder.withCriteria { secUser { eq 'id', springSecurityService.currentUser.id }}
			salesOrderInstance = SalesOrder.get(id)
		}
		if (!salesOrderInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'salesOrder.label', default: 'Sales Order'), id])
			redirect(action: "list")
			return
		}

        [salesOrderInstance: salesOrderInstance]
    }
	@Secured(['IS_AUTHENTICATED_FULLY','ROLE_ADMIN','ROLE_SALES'])
    def update(Long id, Long version) {
        def salesOrderInstance = SalesOrder.get(id)
        if (!salesOrderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salesOrder.label', default: 'Sales Order'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (salesOrderInstance.version > version) {
                salesOrderInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'salesOrder.label', default: 'SalesOrder')] as Object[],
                          "Another user has updated this SalesOrder while you were editing")
                render(view: "edit", model: [salesOrderInstance: salesOrderInstance])
                return
            }
        }

        salesOrderInstance.properties = params

        if (!salesOrderInstance.save(flush: true)) {
            render(view: "edit", model: [salesOrderInstance: salesOrderInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'salesOrder.label', default: 'Sales Order'), salesOrderInstance.id])
        redirect(action: "show", id: salesOrderInstance.id)
    }
	
	@Secured(['IS_AUTHENTICATED_FULLY','ROLE_ADMIN'])
    def delete(Long id) {
        def salesOrderInstance = SalesOrder.get(id)
        if (!salesOrderInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'salesOrder.label', default: 'Sales Order'), id])
            redirect(action: "list")
            return
        }

        try {
            salesOrderInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'salesOrder.label', default: 'Sales Order'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'salesOrder.label', default: 'Sales Order'), id])
            redirect(action: "show", id: id)
        }
    }
	// Capture Customer Signature JSON Data, Processes to Image, and Stream to Database
	@Secured(['ROLE_ADMIN','ROLE_SALES'])
	def processSignature() {
		flash.message = message(code: 'default.created.message', args: [message(code: 'salesOrder.label', default: 'Signature'), ])
		def signature = params.signature
		log.debug(signature)
		response.contentType = "application/json"
		render """{"ok":true}"""
		[signature: signature]		
	}
}
	

