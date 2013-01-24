
<%@ page import="com.aaceglass.sales.SecUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secUser.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-secUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-secUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="fullName" title="${message(code: 'secUser.fullName.label', default: 'Full Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'secUser.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="phoneNumber" title="${message(code: 'secUser.phoneNumber.label', default: 'Phone Number')}" />
					
						<g:sortableColumn property="username" title="${message(code: 'secUser.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'secUser.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${secUserInstanceList}" status="i" var="secUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${secUserInstance.id}">${fieldValue(bean: secUserInstance, field: "fullName")}</g:link></td>
					
						<td>${fieldValue(bean: secUserInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: secUserInstance, field: "phoneNumber")}</td>
					
						<td>${fieldValue(bean: secUserInstance, field: "username")}</td>
					
						<td><g:formatDate date="${secUserInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${secUserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
