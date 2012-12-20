package com.aaceglass.sales



import org.junit.*
import grails.test.mixin.*

@TestFor(GlassTypeController)
@Mock(GlassType)
class GlassTypeControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/glassType/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.glassTypeInstanceList.size() == 0
        assert model.glassTypeInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.glassTypeInstance != null
    }

    void testSave() {
        controller.save()

        assert model.glassTypeInstance != null
        assert view == '/glassType/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/glassType/show/1'
        assert controller.flash.message != null
        assert GlassType.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/glassType/list'

        populateValidParams(params)
        def glassType = new GlassType(params)

        assert glassType.save() != null

        params.id = glassType.id

        def model = controller.show()

        assert model.glassTypeInstance == glassType
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/glassType/list'

        populateValidParams(params)
        def glassType = new GlassType(params)

        assert glassType.save() != null

        params.id = glassType.id

        def model = controller.edit()

        assert model.glassTypeInstance == glassType
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/glassType/list'

        response.reset()

        populateValidParams(params)
        def glassType = new GlassType(params)

        assert glassType.save() != null

        // test invalid parameters in update
        params.id = glassType.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/glassType/edit"
        assert model.glassTypeInstance != null

        glassType.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/glassType/show/$glassType.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        glassType.clearErrors()

        populateValidParams(params)
        params.id = glassType.id
        params.version = -1
        controller.update()

        assert view == "/glassType/edit"
        assert model.glassTypeInstance != null
        assert model.glassTypeInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/glassType/list'

        response.reset()

        populateValidParams(params)
        def glassType = new GlassType(params)

        assert glassType.save() != null
        assert GlassType.count() == 1

        params.id = glassType.id

        controller.delete()

        assert GlassType.count() == 0
        assert GlassType.get(glassType.id) == null
        assert response.redirectedUrl == '/glassType/list'
    }
}
