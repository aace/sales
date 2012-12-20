<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.aaceglass.sales.SalesOrder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>AACE Sales Application</title>
<g:set var="entityName" value="${message(code: 'salesOrder.label', default: 'Sales Order')}" />
</head>
<body><sec:ifLoggedIn>
  <div class="container">
  	<h1 class="span-24 last">Welcome <sec:loggedInUserInfo field="username"></sec:loggedInUserInfo>! </h1>
  	<div class="span-24">
  		<!-- <div class="span-16">
  			<h2></h2>
  		</div> -->	
  		<div class="nav" role="navigation">
  			<ul class="buttons"><li><a href="/SalesOrder/create" class="create">New Sale</a></li>
  				<sec:ifAnyGranted roles = "ROLE_ADMIN">
  					<ul class="show"><li><a href="/SecUser/list">Users</a></li>
  					<ul class="show"><li><a href="/SecUserSecRole/create">Roles</a></li>
  				</sec:ifAnyGranted>
  				<li><a href="iq">In Queue</a></li>
  				<li><a href="pr">Processed</a></li>
  				<li><a href="cp">Complete</a></li>
  				<li><a href="all">All</a></li>
  			</ul>
  		</div>
  			<div id="list-salesOrder" class="content scaffold-list" role="main">
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
  		<!--
  		<div class="span-4 last"></div>
  			<dl class="sidebar">
  				<dt>Statistics</dt>
  				<dd>
  					<ul class="show">
  					<li>In Queue</li>
  					
  					<li>Processed</li>
  					<li>Complete</li>
  					</ul>
  				</dd>
  			</div>
  		 -->
  	</div> 
  </div>
  </sec:ifLoggedIn>
</body>
</html>
