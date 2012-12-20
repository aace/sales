package com.aaceglass.sales

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class GlassTypeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [glassTypeInstanceList: GlassType.list(params), glassTypeInstanceTotal: GlassType.count()]
    }

	@Secured(['ROLE_ADMIN'])
    def create() {
        [glassTypeInstance: new GlassType(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
        def glassTypeInstance = new GlassType(params)
        if (!glassTypeInstance.save(flush: true)) {
            render(view: "create", model: [glassTypeInstance: glassTypeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'glassType.label', default: 'GlassType'), glassTypeInstance.id])
        redirect(action: "show", id: glassTypeInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def show(Long id) {
        def glassTypeInstance = GlassType.get(id)
        if (!glassTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'glassType.label', default: 'GlassType'), id])
            redirect(action: "list")
            return
        }

        [glassTypeInstance: glassTypeInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def glassTypeInstance = GlassType.get(id)
        if (!glassTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'glassType.label', default: 'GlassType'), id])
            redirect(action: "list")
            return
        }

        [glassTypeInstance: glassTypeInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def glassTypeInstance = GlassType.get(id)
        if (!glassTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'glassType.label', default: 'GlassType'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (glassTypeInstance.version > version) {
                glassTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'glassType.label', default: 'GlassType')] as Object[],
                          "Another user has updated this GlassType while you were editing")
                render(view: "edit", model: [glassTypeInstance: glassTypeInstance])
                return
            }
        }

        glassTypeInstance.properties = params

        if (!glassTypeInstance.save(flush: true)) {
            render(view: "edit", model: [glassTypeInstance: glassTypeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'glassType.label', default: 'GlassType'), glassTypeInstance.id])
        redirect(action: "show", id: glassTypeInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def glassTypeInstance = GlassType.get(id)
        if (!glassTypeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'glassType.label', default: 'GlassType'), id])
            redirect(action: "list")
            return
        }

        try {
            glassTypeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'glassType.label', default: 'GlassType'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'glassType.label', default: 'GlassType'), id])
            redirect(action: "show", id: id)
        }
    }
}
