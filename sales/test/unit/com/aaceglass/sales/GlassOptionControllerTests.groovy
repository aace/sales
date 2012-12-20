package com.aaceglass.sales



import org.junit.*
import grails.test.mixin.*

@TestFor(GlassOptionController)
@Mock(GlassOption)
class GlassOptionControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/glassOption/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.glassOptionInstanceList.size() == 0
        assert model.glassOptionInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.glassOptionInstance != null
    }

    void testSave() {
        controller.save()

        assert model.glassOptionInstance != null
        assert view == '/glassOption/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/glassOption/show/1'
        assert controller.flash.message != null
        assert GlassOption.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/glassOption/list'

        populateValidParams(params)
        def glassOption = new GlassOption(params)

        assert glassOption.save() != null

        params.id = glassOption.id

        def model = controller.show()

        assert model.glassOptionInstance == glassOption
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/glassOption/list'

        populateValidParams(params)
        def glassOption = new GlassOption(params)

        assert glassOption.save() != null

        params.id = glassOption.id

        def model = controller.edit()

        assert model.glassOptionInstance == glassOption
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/glassOption/list'

        response.reset()

        populateValidParams(params)
        def glassOption = new GlassOption(params)

        assert glassOption.save() != null

        // test invalid parameters in update
        params.id = glassOption.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/glassOption/edit"
        assert model.glassOptionInstance != null

        glassOption.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/glassOption/show/$glassOption.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        glassOption.clearErrors()

        populateValidParams(params)
        params.id = glassOption.id
        params.version = -1
        controller.update()

        assert view == "/glassOption/edit"
        assert model.glassOptionInstance != null
        assert model.glassOptionInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/glassOption/list'

        response.reset()

        populateValidParams(params)
        def glassOption = new GlassOption(params)

        assert glassOption.save() != null
        assert GlassOption.count() == 1

        params.id = glassOption.id

        controller.delete()

        assert GlassOption.count() == 0
        assert GlassOption.get(glassOption.id) == null
        assert response.redirectedUrl == '/glassOption/list'
    }
}
