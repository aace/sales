package com.aaceglass.sales

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class SecUserSecRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	@Secured(['ROLE_ADMIN'])
    def index() {
        redirect(action: "list", params: params)
    }

	@Secured(['ROLE_ADMIN'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [secUserSecRoleInstanceList: SecUserSecRole.list(params), secUserSecRoleInstanceTotal: SecUserSecRole.count()]
    }

	@Secured(['ROLE_ADMIN'])
    def create() {
        [secUserSecRoleInstance: new SecUserSecRole(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
        def secUserSecRoleInstance = new SecUserSecRole(params)
        if (!secUserSecRoleInstance.save(flush: true)) {
            render(view: "create", model: [secUserSecRoleInstance: secUserSecRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), secUserSecRoleInstance.id])
        redirect(action: "show", id: secUserSecRoleInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def show(Long id) {
        def secUserSecRoleInstance = SecUserSecRole.get(id)
        if (!secUserSecRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "list")
            return
        }

        [secUserSecRoleInstance: secUserSecRoleInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def secUserSecRoleInstance = SecUserSecRole.get(id)
        if (!secUserSecRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "list")
            return
        }

        [secUserSecRoleInstance: secUserSecRoleInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def secUserSecRoleInstance = SecUserSecRole.get(id)
        if (!secUserSecRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secUserSecRoleInstance.version > version) {
                secUserSecRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'secUserSecRole.label', default: 'SecUserSecRole')] as Object[],
                          "Another user has updated this SecUserSecRole while you were editing")
                render(view: "edit", model: [secUserSecRoleInstance: secUserSecRoleInstance])
                return
            }
        }

        secUserSecRoleInstance.properties = params

        if (!secUserSecRoleInstance.save(flush: true)) {
            render(view: "edit", model: [secUserSecRoleInstance: secUserSecRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), secUserSecRoleInstance.id])
        redirect(action: "show", id: secUserSecRoleInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def secUserSecRoleInstance = SecUserSecRole.get(id)
        if (!secUserSecRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "list")
            return
        }

        try {
            secUserSecRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secUserSecRole.label', default: 'SecUserSecRole'), id])
            redirect(action: "show", id: id)
        }
    }
}
