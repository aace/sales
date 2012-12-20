<%@ page import="com.aaceglass.sales.SecUser" %>



<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'fullName', 'error')} required">
	<label for="fullName">
		<g:message code="secUser.fullName.label" default="Full Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fullName" required="" value="${secUserInstance?.fullName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="secUser.email.label" default="Email" />
		
	</label>
	<g:field type="email" name="email" value="${secUserInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'phoneNumber', 'error')} ">
	<label for="phoneNumber">
		<g:message code="secUser.phoneNumber.label" default="Phone Number" />
		
	</label>
	<g:textField name="phoneNumber" value="${secUserInstance?.phoneNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="secUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${secUserInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="secUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${secUserInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="secUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${secUserInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="secUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${secUserInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="secUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${secUserInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="secUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${secUserInstance?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: secUserInstance, field: 'salesOrders', 'error')} ">
	<label for="salesOrders">
		<g:message code="secUser.salesOrders.label" default="Sales Orders" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${secUserInstance?.salesOrders?}" var="s">
    <li><g:link controller="salesOrder" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="salesOrder" action="create" params="['secUser.id': secUserInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'salesOrder.label', default: 'SalesOrder')])}</g:link>
</li>
</ul>

</div>

