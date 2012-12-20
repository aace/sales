<%@ page import="com.aaceglass.sales.GlassOption" %>



<div class="fieldcontain ${hasErrors(bean: glassOptionInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="glassOption.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${glassOptionInstance?.name}"/>
</div>

