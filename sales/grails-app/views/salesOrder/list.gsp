
<%@ page import="com.aaceglass.sales.SalesOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'salesOrder.label', default: 'SalesOrder')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-salesOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-salesOrder" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'salesOrder.id.label', default: 'ID')}" />
						
						<g:sortableColumn property="jobType" title="${message(code: 'salesOrder.jobType.label', default: 'Job Type')}" />
					
						<g:sortableColumn property="custLastName" title="${message(code: 'salesOrder.custLastName.label', default: 'Last Name')}" />
					
						<g:sortableColumn property="vehicleYear" title="${message(code: 'salesOrder.vehicleYear.label', default: 'Year')}" />
					
						<g:sortableColumn property="vehicleModel" title="${message(code: 'salesOrder.vehicleModel.label', default: 'Model')}" />
					
						<g:sortableColumn property="custBestNumber" title="${message(code: 'salesOrder.custBestNumber.label', default: 'Best Number')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${salesOrderInstanceList}" status="i" var="salesOrderInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${salesOrderInstance.id}">${fieldValue(bean: salesOrderInstance, field: "id")}</g:link></td>
					
						<td>${fieldValue(bean: salesOrderInstance, field: "jobType")}</td>
					
						<td>${fieldValue(bean: salesOrderInstance, field: "custLastName")}</td>
					
						<td>${fieldValue(bean: salesOrderInstance, field: "vehicleYear")}</td>
					
						<td>${fieldValue(bean: salesOrderInstance, field: "vehicleModel")}</td>
					
						<td>${fieldValue(bean: salesOrderInstance, field: "custBestNumber")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${salesOrderInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
