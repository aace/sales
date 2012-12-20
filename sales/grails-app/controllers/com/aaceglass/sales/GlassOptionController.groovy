package com.aaceglass.sales

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class GlassOptionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
    def index() {
        redirect(action: "list", params: params)
    }
	
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [glassOptionInstanceList: GlassOption.list(params), glassOptionInstanceTotal: GlassOption.count()]
    }

	@Secured(['ROLE_ADMIN'])
    def create() {
        [glassOptionInstance: new GlassOption(params)]
    }

	@Secured(['ROLE_ADMIN'])
    def save() {
        def glassOptionInstance = new GlassOption(params)
        if (!glassOptionInstance.save(flush: true)) {
            render(view: "create", model: [glassOptionInstance: glassOptionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'glassOption.label', default: 'GlassOption'), glassOptionInstance.id])
        redirect(action: "show", id: glassOptionInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def show(Long id) {
        def glassOptionInstance = GlassOption.get(id)
        if (!glassOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'glassOption.label', default: 'GlassOption'), id])
            redirect(action: "list")
            return
        }

        [glassOptionInstance: glassOptionInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def edit(Long id) {
        def glassOptionInstance = GlassOption.get(id)
        if (!glassOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'glassOption.label', default: 'GlassOption'), id])
            redirect(action: "list")
            return
        }

        [glassOptionInstance: glassOptionInstance]
    }

	@Secured(['ROLE_ADMIN'])
    def update(Long id, Long version) {
        def glassOptionInstance = GlassOption.get(id)
        if (!glassOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'glassOption.label', default: 'GlassOption'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (glassOptionInstance.version > version) {
                glassOptionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'glassOption.label', default: 'GlassOption')] as Object[],
                          "Another user has updated this Glass Option while you were editing")
                render(view: "edit", model: [glassOptionInstance: glassOptionInstance])
                return
            }
        }

        glassOptionInstance.properties = params

        if (!glassOptionInstance.save(flush: true)) {
            render(view: "edit", model: [glassOptionInstance: glassOptionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'glassOption.label', default: 'GlassOption'), glassOptionInstance.id])
        redirect(action: "show", id: glassOptionInstance.id)
    }

	@Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def glassOptionInstance = GlassOption.get(id)
        if (!glassOptionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'glassOption.label', default: 'GlassOption'), id])
            redirect(action: "list")
            return
        }

        try {
            glassOptionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'glassOption.label', default: 'GlassOption'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'glassOption.label', default: 'GlassOption'), id])
            redirect(action: "show", id: id)
        }
    }
}
