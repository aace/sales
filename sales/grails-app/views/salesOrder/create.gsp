<%@ page import="com.aaceglass.sales.SalesOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'salesOrder.label', default: 'Sales Order')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
				<!--  for jQuery signature -->
		<link type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/themes/south-street/jquery-ui.css" rel="stylesheet">
		<link type="text/css" href="${resource(dir: 'css', file: 'jquery.signature.css')}" rel="stylesheet">
		<style type="text/css">
			.kbw-signature { width: 500px; height: 150px; }
		</style>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>
		
		<!--[if IE]>
			<script type="text/javascript" src="excanvas.js"></script>
		<![endif]-->
		
		<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.signature.js')}"></script>
		<script type="text/javascript">
		$(function() {
			$('#sig').signature();
			$('#clear').click(function() {
				$('#sig').signature('clear');
			});
			$('#json').click(function() {
				alert($('#sig').signature('toJSON'));
			});
			$('#captureSignature').signature({syncField: "#jsonSignature"}); 
		});

		</script>
	</head>
	<body>
		<a href="#create-salesOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="create-salesOrder" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${salesOrderInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${salesOrderInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
