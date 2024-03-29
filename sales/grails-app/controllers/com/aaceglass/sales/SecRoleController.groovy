package com.aaceglass.sales

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class SecRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	@Secured(['ROLE_ADMIN'])
    def index() {
        redirect(action: "list", params: params)
    }

	@Secured(['ROLE_ADMIN'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [secRoleInstanceList: SecRole.list(params), secRoleInstanceTotal: SecRole.count()]
    }

	@Secured(['ROLE_ADMIN'])
    def create() {
        [secRoleInstance: new SecRole(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
        def secRoleInstance = new SecRole(params)
        if (!secRoleInstance.save(flush: true)) {
            render(view: "create", model: [secRoleInstance: secRoleInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'secRole.label', default: 'SecRole'), secRoleInstance.id])
        redirect(action: "show", id: secRoleInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def show(Long id) {
        def secRoleInstance = SecRole.get(id)
        if (!secRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "list")
            return
        }

        [secRoleInstance: secRoleInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def secRoleInstance = SecRole.get(id)
        if (!secRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "list")
            return
        }

        [secRoleInstance: secRoleInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def secRoleInstance = SecRole.get(id)
        if (!secRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (secRoleInstance.version > version) {
                secRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'secRole.label', default: 'SecRole')] as Object[],
                          "Another user has updated this SecRole while you were editing")
                render(view: "edit", model: [secRoleInstance: secRoleInstance])
                return
            }
        }

        secRoleInstance.properties = params

        if (!secRoleInstance.save(flush: true)) {
            render(view: "edit", model: [secRoleInstance: secRoleInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'secRole.label', default: 'SecRole'), secRoleInstance.id])
        redirect(action: "show", id: secRoleInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def secRoleInstance = SecRole.get(id)
        if (!secRoleInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "list")
            return
        }

        try {
            secRoleInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'secRole.label', default: 'SecRole'), id])
            redirect(action: "show", id: id)
        }
    }
}
