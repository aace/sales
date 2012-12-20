<%@ page import="com.aaceglass.sales.GlassType" %>



<div class="fieldcontain ${hasErrors(bean: glassTypeInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="glassType.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${glassTypeInstance?.name}"/>
</div>

