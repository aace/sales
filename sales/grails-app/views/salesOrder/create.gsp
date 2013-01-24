<%@ page import="com.aaceglass.sales.SalesOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'salesOrder.label', default: 'Sales Order')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		<!--[if lt IE 9]><script type="text/javascript" src="${resource(dir: 'js', file: 'excanvas.compiled.js')}"></script><![endif]-->
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.4.4.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.signature-panel.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.signature-panel.css')}" type="text/css"/>
<!--  jQuery signature element code begins here -->
	<script type="text/javascript">
        function signatureOK(signatureData) {
            // Send the signature to the server and generate an image file.
            $.ajax({
                url:"processSignature",
                type:"POST",
                data:{"signature": JSON.stringify(signatureData)},
                //contentType:"application/json; charset=utf-8",
                success: function(data, textStatus, jqXHR){
                    //set the hidden field value
                    $('#sig').val(JSON.stringify(signatureData));
                    //show signature on same page as preview (optional)
                    $("#latest-signature").signaturePanel("drawClickstreamToCanvas", signatureData);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                    console.log(errorThrown);
                }
            });
            $("#sig-panel").signaturePanel("clear");
            
        }

		
        function signatureCancel() {
            alert("You clicked Cancel.");
        }

        $(document).ready(function() {
            $("#sig-panel").signaturePanel({
                okCallback: signatureOK,
                cancelCallback: signatureCancel
            });
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
