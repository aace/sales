<%@ page import="com.aaceglass.sales.SalesOrder" %>

<calendar:resources lang="en" theme="blue"/>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'jobType', 'error')} required">
	<label for="jobType">
		<g:message code="salesOrder.jobType.label" default="Job Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="jobType" from="${salesOrderInstance.constraints.jobType.inList}" required="" value="${salesOrderInstance?.jobType}" valueMessagePrefix="salesOrder.jobType"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'custFirstName', 'error')} required">
	<label for="custFirstName">
		<g:message code="salesOrder.custFirstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="custFirstName" required="" value="${salesOrderInstance?.custFirstName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'custLastName', 'error')} required">
	<label for="custLastName">
		<g:message code="salesOrder.custLastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="custLastName" required="" value="${salesOrderInstance?.custLastName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'custBestNumber', 'error')} required">
	<label for="custBestNumber">
		<g:message code="salesOrder.custBestNumber.label" default="Best Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="custBestNumber" maxlength="10" required="" value="${salesOrderInstance?.custBestNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'custAlternateNumber', 'error')} ">
	<label for="custAlternateNumber">
		<g:message code="salesOrder.custAlternateNumber.label" default="Alternate Number" />
		
	</label>
	<g:textField name="custAlternateNumber" value="${salesOrderInstance?.custAlternateNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'custEmail', 'error')} required">
	<label for="custEmail">
		<g:message code="salesOrder.custEmail.label" default="E-mail" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="custEmail" required="" value="${salesOrderInstance?.custEmail}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'custAddress', 'error')} required">
	<label for="custAddress">
		<g:message code="salesOrder.custAddress.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="custAddress" required="" value="${salesOrderInstance?.custAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'custAddress2', 'error')} ">
	<label for="custAddress2">
		<g:message code="salesOrder.custAddress2.label" default="Address2" />
		
	</label>
	<g:textField name="custAddress2" value="${salesOrderInstance?.custAddress2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'custCity', 'error')} required">
	<label for="custCity">
		<g:message code="salesOrder.custCity.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="custCity" required="" value="${salesOrderInstance?.custCity}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'custState', 'error')} required">
	<label for="custState">
		<g:message code="salesOrder.custState.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="custState" maxlength="2" required="" value="${salesOrderInstance?.custState}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'custZip', 'error')} required">
	<label for="custZip">
		<g:message code="salesOrder.custZip.label" default="Zip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="custZip" maxlength="5" required="" value="${salesOrderInstance?.custZip}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'vehicleYear', 'error')} required">
	<label for="vehicleYear">
		<g:message code="salesOrder.vehicleYear.label" default="Year" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vehicleYear" maxlength="4" required="" value="${salesOrderInstance?.vehicleYear}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'vehicleMake', 'error')} required">
	<label for="vehicleMake">
		<g:message code="salesOrder.vehicleMake.label" default="Make" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vehicleMake" required="" value="${salesOrderInstance?.vehicleMake}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'vehicleModel', 'error')} required">
	<label for="vehicleModel">
		<g:message code="salesOrder.vehicleModel.label" default="Model" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vehicleModel" required="" value="${salesOrderInstance?.vehicleModel}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'vehicleVin', 'error')} required">
	<label for="vehicleVin">
		<g:message code="salesOrder.vehicleVin.label" default="VIN" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vehicleVin" maxlength="17" required="" value="${salesOrderInstance?.vehicleVin}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'glassTypes', 'error')} ">
	<label for="glassTypes">
		<g:message code="salesOrder.glassTypes.label" default="Glass Types" />
		
	</label>
	<g:select name="glassTypes" from="${com.aaceglass.sales.GlassType.list()}" multiple="multiple" optionKey="id" size="5" value="${salesOrderInstance?.glassTypes*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'options', 'error')} ">
	<label for="options">
		<g:message code="salesOrder.options.label" default="Options" />
		
	</label>
	<g:select name="options" from="${com.aaceglass.sales.GlassOption.list()}" multiple="multiple" optionKey="id" size="5" value="${salesOrderInstance?.options*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'insuranceDateOfLoss', 'error')} ">
	<label for="insuranceDateOfLoss">
		<g:message code="salesOrder.insuranceDateOfLoss.label" default="Date Of Loss" />
		
	</label>
	<calendar:datePicker name="insuranceDateOfLoss" defaultValue="${salesOrderInstance?.insuranceDateOfLoss }"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'insuranceCompany', 'error')} ">
	<label for="insuranceCompany">
		<g:message code="salesOrder.insuranceCompany.label" default="Insurance Company" />
		
	</label>
	<g:textField name="insuranceCompany" value="${salesOrderInstance?.insuranceCompany}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'insurancePolicyNumber', 'error')} ">
	<label for="insurancePolicyNumber">
		<g:message code="salesOrder.insurancePolicyNumber.label" default="Policy Number" />
		
	</label>
	<g:textField name="insurancePolicyNumber" value="${salesOrderInstance?.insurancePolicyNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'insuranceClaimNumber', 'error')} ">
	<label for="insuranceClaimNumber">
		<g:message code="salesOrder.insuranceClaimNumber.label" default="Claim Number" />
		
	</label>
	<g:textField name="insuranceClaimNumber" value="${salesOrderInstance?.insuranceClaimNumber}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'insuranceDeductible', 'error')} ">
	<label for="insuranceDeductible">
		<g:message code="salesOrder.insuranceDeductible.label" default="Deductible" />
		
	</label>
	<g:textField name="insuranceDeductible" value="${salesOrderInstance?.insuranceDeductible}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'installDate', 'error')} required">
	<label for="installDate">
		<g:message code="salesOrder.installDate.label" default="Install Date" />
		<span class="required-indicator">*</span>
	</label>
	<calendar:datePicker name="installDate" defaultValue="${salesOrderInstance?.installDate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'installTime', 'error')} required">
	<label for="installTime">
		<g:message code="salesOrder.installTime.label" default="Install Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="installTime" from="${salesOrderInstance.constraints.installTime.inList}" required="" value="${salesOrderInstance?.installTime}" valueMessagePrefix="salesOrder.installTime"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'installLocation', 'error')} required">
	<label for="installLocation">
		<g:message code="salesOrder.installLocation.label" default="Install Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="installLocation" from="${salesOrderInstance.constraints.installLocation.inList}" required="" value="${salesOrderInstance?.installLocation}" valueMessagePrefix="salesOrder.installLocation"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'installCrossStreet1', 'error')} required">
	<label for="installCrossStreet1">
		<g:message code="salesOrder.installCrossStreet1.label" default="Cross Street1" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="installCrossStreet1" required="" value="${salesOrderInstance?.installCrossStreet1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'installCrossStreet2', 'error')} required">
	<label for="installCrossStreet2">
		<g:message code="salesOrder.installCrossStreet2.label" default="Cross Street2" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="installCrossStreet2" required="" value="${salesOrderInstance?.installCrossStreet2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'installAddress', 'error')} ">
	<label for="installAddress">
		<g:message code="salesOrder.installAddress.label" default="Install Address" />
		
	</label>
	<g:textField name="installAddress" value="${salesOrderInstance?.installAddress}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'installCity', 'error')} ">
	<label for="installCity">
		<g:message code="salesOrder.installCity.label" default="Install City" />
		
	</label>
	<g:textField name="installCity" value="${salesOrderInstance?.installCity}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'paymentType', 'error')} required">
	<label for="paymentType">
		<g:message code="salesOrder.paymentType.label" default="Payment Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="paymentType" from="${salesOrderInstance.constraints.paymentType.inList}" required="" value="${salesOrderInstance?.paymentType}" valueMessagePrefix="salesOrder.paymentType"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'claimStatus', 'error')} ">
	<label for="claimStatus">
		<g:message code="salesOrder.claimStatus.label" default="Claim Status" />
		
	</label>
	<g:select name="claimStatus" from="${salesOrderInstance.constraints.claimStatus.inList}" value="${salesOrderInstance?.claimStatus}" valueMessagePrefix="salesOrder.claimStatus" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'notes', 'error')} ">
	<label for="notes">
		<g:message code="salesOrder.notes.label" default="Notes" />
		
	</label>
	<g:textArea name="notes" cols="40" rows="5" maxlength="1024" value="${salesOrderInstance?.notes}"/>
</div>

<!-- jQuery signature element --> 
<div class="fieldcontain" ${hasErrors(bean: salesOrderInstance, field: 'sig','error') } ">
	<label for="sig">
	<g:message code="salesOrder.sig.label" default="Signature" />
	</label>
	<div id="sig" class="kbw-signature"></div>
	<p style="clear: both;"><button id="clear">Clear</button> <button id="json">To JSON</button></p>
</div>
<!--End of signature element -->
	
<sec:ifAllGranted roles="ROLE_ADMIN">
	<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'orderStatus', 'error')} required">
		<label for="orderStatus">
			<g:message code="salesOrder.orderStatus.label" default="Order Status" />
			<span class="required-indicator">*</span>
		</label>
		<g:select name="orderStatus" from="${salesOrderInstance.constraints.orderStatus.inList}" required="" value="${salesOrderInstance?.orderStatus}" valueMessagePrefix="salesOrder.orderStatus" noSelection="['':'']"/>	
	</div>
</sec:ifAllGranted>

<sec:ifAllGranted roles="ROLE_SALES">
	<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'orderStatus', 'error')} required">
		<g:hiddenField name="orderStatus" value="In Queue" />	
	</div>
</sec:ifAllGranted>

<sec:ifAllGranted roles="ROLE_ADMIN">
<div class="fieldcontain ${hasErrors(bean: salesOrderInstance, field: 'orderId', 'error')} ">
	<label for="orderId">
		<g:message code="salesOrder.orderId.label" default="Order Id" />		
	</label>
	<g:textField name="orderId" value="${salesOrderInstance?.orderId}"/>
</div>
</sec:ifAllGranted>