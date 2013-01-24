
<%@ page import="com.aaceglass.sales.SalesOrder" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'salesOrder.label', default: 'SalesOrder')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	<!--  Signature panel  -->	
	<!--[if lt IE 9]><script type="text/javascript" src="${resource(dir: 'js', file: 'excanvas.compiled.js')}"></script><![endif]-->
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.4.4.min.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.signature-panel.js')}"></script>

    <script type="text/javascript">
        var playing, lastSignature;
        playing = false;
		
        function signatureOK(signatureData) {

        	lastSignature = signatureData;
            $("#sig-panel").signaturePanel("clear");
        }

        function signatureCancel() {
            alert("The user clicked Cancel.");
        }

        function playbackCallback(frameTime, totalTime) {
            return !playing;
        }

        function onTargetClick() {
            if (lastSignature) {
                playing = !playing;
                if (playing) {
                    $("#sig-target").signaturePanel("animateClickstreamToCanvas", lastSignature, playbackCallback);
                } else {
                    $("#sig-target").signaturePanel("drawClickstreamToCanvas", lastSignature);
                }
            } else {
                alert("Enter a signature first.");
            }
        }

        $(document).ready(function() {
            $("#sig-panel").signaturePanel({
                okCallback: signatureOK,
                cancelCallback: signatureCancel
            });
            $("#sig-target").click(onTargetClick);
			//set the hidden field value
            $('#signatureData').val(${salesOrderInstance.sig});
        });

    </script>
	</head>
	<body>
		<a href="#show-salesOrder" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-salesOrder" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list salesOrder">
			
				<g:if test="${salesOrderInstance?.jobType}">
				<li class="fieldcontain">
					<span id="jobType-label" class="property-label"><g:message code="salesOrder.jobType.label" default="Job Type" /></span>
					
						<span class="property-value" aria-labelledby="jobType-label"><g:fieldValue bean="${salesOrderInstance}" field="jobType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.custFirstName}">
				<li class="fieldcontain">
					<span id="custFirstName-label" class="property-label"><g:message code="salesOrder.custFirstName.label" default="Cust First Name" /></span>
					
						<span class="property-value" aria-labelledby="custFirstName-label"><g:fieldValue bean="${salesOrderInstance}" field="custFirstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.custLastName}">
				<li class="fieldcontain">
					<span id="custLastName-label" class="property-label"><g:message code="salesOrder.custLastName.label" default="Cust Last Name" /></span>
					
						<span class="property-value" aria-labelledby="custLastName-label"><g:fieldValue bean="${salesOrderInstance}" field="custLastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.custBestNumber}">
				<li class="fieldcontain">
					<span id="custBestNumber-label" class="property-label"><g:message code="salesOrder.custBestNumber.label" default="Cust Best Number" /></span>
					
						<span class="property-value" aria-labelledby="custBestNumber-label"><g:fieldValue bean="${salesOrderInstance}" field="custBestNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.custAlternateNumber}">
				<li class="fieldcontain">
					<span id="custAlternateNumber-label" class="property-label"><g:message code="salesOrder.custAlternateNumber.label" default="Cust Alternate Number" /></span>
					
						<span class="property-value" aria-labelledby="custAlternateNumber-label"><g:fieldValue bean="${salesOrderInstance}" field="custAlternateNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.custEmail}">
				<li class="fieldcontain">
					<span id="custEmail-label" class="property-label"><g:message code="salesOrder.custEmail.label" default="Cust Email" /></span>
					
						<span class="property-value" aria-labelledby="custEmail-label"><g:fieldValue bean="${salesOrderInstance}" field="custEmail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.custAddress}">
				<li class="fieldcontain">
					<span id="custAddress-label" class="property-label"><g:message code="salesOrder.custAddress.label" default="Cust Address" /></span>
					
						<span class="property-value" aria-labelledby="custAddress-label"><g:fieldValue bean="${salesOrderInstance}" field="custAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.custAddress2}">
				<li class="fieldcontain">
					<span id="custAddress2-label" class="property-label"><g:message code="salesOrder.custAddress2.label" default="Cust Address2" /></span>
					
						<span class="property-value" aria-labelledby="custAddress2-label"><g:fieldValue bean="${salesOrderInstance}" field="custAddress2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.custCity}">
				<li class="fieldcontain">
					<span id="custCity-label" class="property-label"><g:message code="salesOrder.custCity.label" default="Cust City" /></span>
					
						<span class="property-value" aria-labelledby="custCity-label"><g:fieldValue bean="${salesOrderInstance}" field="custCity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.custState}">
				<li class="fieldcontain">
					<span id="custState-label" class="property-label"><g:message code="salesOrder.custState.label" default="Cust State" /></span>
					
						<span class="property-value" aria-labelledby="custState-label"><g:fieldValue bean="${salesOrderInstance}" field="custState"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.custZip}">
				<li class="fieldcontain">
					<span id="custZip-label" class="property-label"><g:message code="salesOrder.custZip.label" default="Cust Zip" /></span>
					
						<span class="property-value" aria-labelledby="custZip-label"><g:fieldValue bean="${salesOrderInstance}" field="custZip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.vehicleYear}">
				<li class="fieldcontain">
					<span id="vehicleYear-label" class="property-label"><g:message code="salesOrder.vehicleYear.label" default="Vehicle Year" /></span>
					
						<span class="property-value" aria-labelledby="vehicleYear-label"><g:fieldValue bean="${salesOrderInstance}" field="vehicleYear"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.vehicleMake}">
				<li class="fieldcontain">
					<span id="vehicleMake-label" class="property-label"><g:message code="salesOrder.vehicleMake.label" default="Vehicle Make" /></span>
					
						<span class="property-value" aria-labelledby="vehicleMake-label"><g:fieldValue bean="${salesOrderInstance}" field="vehicleMake"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.vehicleModel}">
				<li class="fieldcontain">
					<span id="vehicleModel-label" class="property-label"><g:message code="salesOrder.vehicleModel.label" default="Vehicle Model" /></span>
					
						<span class="property-value" aria-labelledby="vehicleModel-label"><g:fieldValue bean="${salesOrderInstance}" field="vehicleModel"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.vehicleVin}">
				<li class="fieldcontain">
					<span id="vehicleVin-label" class="property-label"><g:message code="salesOrder.vehicleVin.label" default="Vehicle Vin" /></span>
					
						<span class="property-value" aria-labelledby="vehicleVin-label"><g:fieldValue bean="${salesOrderInstance}" field="vehicleVin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.glassTypes}">
				<li class="fieldcontain">
					<span id="glassTypes-label" class="property-label"><g:message code="salesOrder.glassTypes.label" default="Glass Types" /></span>
					
						<g:each in="${salesOrderInstance.glassTypes}" var="g">
						<span class="property-value" aria-labelledby="glassTypes-label"><g:link controller="glassType" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.options}">
				<li class="fieldcontain">
					<span id="options-label" class="property-label"><g:message code="salesOrder.options.label" default="Options" /></span>
					
						<g:each in="${salesOrderInstance.options}" var="o">
						<span class="property-value" aria-labelledby="options-label"><g:link controller="glassOption" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.insuranceDateOfLoss}">
				<li class="fieldcontain">
					<span id="insuranceDateOfLoss-label" class="property-label"><g:message code="salesOrder.insuranceDateOfLoss.label" default="Insurance Date Of Loss" /></span>
					
						<span class="property-value" aria-labelledby="insuranceDateOfLoss-label"><g:formatDate date="${salesOrderInstance?.insuranceDateOfLoss}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.insuranceCompany}">
				<li class="fieldcontain">
					<span id="insuranceCompany-label" class="property-label"><g:message code="salesOrder.insuranceCompany.label" default="Insurance Company" /></span>
					
						<span class="property-value" aria-labelledby="insuranceCompany-label"><g:fieldValue bean="${salesOrderInstance}" field="insuranceCompany"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.insurancePolicyNumber}">
				<li class="fieldcontain">
					<span id="insurancePolicyNumber-label" class="property-label"><g:message code="salesOrder.insurancePolicyNumber.label" default="Insurance Policy Number" /></span>
					
						<span class="property-value" aria-labelledby="insurancePolicyNumber-label"><g:fieldValue bean="${salesOrderInstance}" field="insurancePolicyNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.insuranceClaimNumber}">
				<li class="fieldcontain">
					<span id="insuranceClaimNumber-label" class="property-label"><g:message code="salesOrder.insuranceClaimNumber.label" default="Insurance Claim Number" /></span>
					
						<span class="property-value" aria-labelledby="insuranceClaimNumber-label"><g:fieldValue bean="${salesOrderInstance}" field="insuranceClaimNumber"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.insuranceDeductible}">
				<li class="fieldcontain">
					<span id="insuranceDeductible-label" class="property-label"><g:message code="salesOrder.insuranceDeductible.label" default="Insurance Deductible" /></span>
					
						<span class="property-value" aria-labelledby="insuranceDeductible-label"><g:fieldValue bean="${salesOrderInstance}" field="insuranceDeductible"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.installDate}">
				<li class="fieldcontain">
					<span id="installDate-label" class="property-label"><g:message code="salesOrder.installDate.label" default="Install Date" /></span>
					
						<span class="property-value" aria-labelledby="installDate-label"><g:formatDate date="${salesOrderInstance?.installDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.installTime}">
				<li class="fieldcontain">
					<span id="installTime-label" class="property-label"><g:message code="salesOrder.installTime.label" default="Install Time" /></span>
					
						<span class="property-value" aria-labelledby="installTime-label"><g:fieldValue bean="${salesOrderInstance}" field="installTime"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.installLocation}">
				<li class="fieldcontain">
					<span id="installLocation-label" class="property-label"><g:message code="salesOrder.installLocation.label" default="Install Location" /></span>
					
						<span class="property-value" aria-labelledby="installLocation-label"><g:fieldValue bean="${salesOrderInstance}" field="installLocation"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.installCrossStreet1}">
				<li class="fieldcontain">
					<span id="installCrossStreet1-label" class="property-label"><g:message code="salesOrder.installCrossStreet1.label" default="Install Cross Street1" /></span>
					
						<span class="property-value" aria-labelledby="installCrossStreet1-label"><g:fieldValue bean="${salesOrderInstance}" field="installCrossStreet1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.installCrossStreet2}">
				<li class="fieldcontain">
					<span id="installCrossStreet2-label" class="property-label"><g:message code="salesOrder.installCrossStreet2.label" default="Install Cross Street2" /></span>
					
						<span class="property-value" aria-labelledby="installCrossStreet2-label"><g:fieldValue bean="${salesOrderInstance}" field="installCrossStreet2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.installAddress}">
				<li class="fieldcontain">
					<span id="installAddress-label" class="property-label"><g:message code="salesOrder.installAddress.label" default="Install Address" /></span>
					
						<span class="property-value" aria-labelledby="installAddress-label"><g:fieldValue bean="${salesOrderInstance}" field="installAddress"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.installCity}">
				<li class="fieldcontain">
					<span id="installCity-label" class="property-label"><g:message code="salesOrder.installCity.label" default="Install City" /></span>
					
						<span class="property-value" aria-labelledby="installCity-label"><g:fieldValue bean="${salesOrderInstance}" field="installCity"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.paymentType}">
				<li class="fieldcontain">
					<span id="paymentType-label" class="property-label"><g:message code="salesOrder.paymentType.label" default="Payment Type" /></span>
					
						<span class="property-value" aria-labelledby="paymentType-label"><g:fieldValue bean="${salesOrderInstance}" field="paymentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.claimStatus}">
				<li class="fieldcontain">
					<span id="claimStatus-label" class="property-label"><g:message code="salesOrder.claimStatus.label" default="Claim Status" /></span>
					
						<span class="property-value" aria-labelledby="claimStatus-label"><g:fieldValue bean="${salesOrderInstance}" field="claimStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.orderStatus}">
				<li class="fieldcontain">
					<span id="orderStatus-label" class="property-label"><g:message code="salesOrder.orderStatus.label" default="Order Status" /></span>
					
						<span class="property-value" aria-labelledby="orderStatus-label"><g:fieldValue bean="${salesOrderInstance}" field="orderStatus"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.orderId}">
				<li class="fieldcontain">
					<span id="orderId-label" class="property-label"><g:message code="salesOrder.orderId.label" default="Order Id" /></span>
					
						<span class="property-value" aria-labelledby="orderId-label"><g:fieldValue bean="${salesOrderInstance}" field="orderId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.notes}">
				<li class="fieldcontain">
					<span id="notes-label" class="property-label"><g:message code="salesOrder.notes.label" default="Notes" /></span>
					
						<span class="property-value" aria-labelledby="notes-label"><g:fieldValue bean="${salesOrderInstance}" field="notes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="salesOrder.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${salesOrderInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${salesOrderInstance?.secUser}">
				<li class="fieldcontain">
					<span id="secUser-label" class="property-label"><g:message code="salesOrder.secUser.label" default="Sold By" /></span>
					
						<span class="property-value" aria-labelledby="secUser-label"><g:link controller="secUser" action="show" id="${salesOrderInstance?.secUser?.id}">${salesOrderInstance?.secUser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
				
				<!-- Signature Panel -->
				<g:if test="${salesOrderInstance?.sig}">
				<li class="fieldcontain">
					<span id="sig-label" class="property-label"><g:message code="saleOrder.sig.label" default="Customer Signature" /></span>
					
						<span class="property-value" aria-labelledby="sig-label"><canvas id="sig-target" height="100" width="250" style="border: 1px solid gray;" ></canvas></span>
				</li>
				</g:if>
				<!-- End Panel -->
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${salesOrderInstance?.id}" />
					<g:link class="edit" action="edit" id="${salesOrderInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
