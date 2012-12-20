package com.aaceglass.sales

class SalesOrder {
	
	static belongsTo = [secUser : SecUser]
		
	
	String claimStatus
	String orderStatus
	String jobType
	String paymentType
	
	String orderId
	
	String custFirstName
	String custLastName
	String custBestNumber
	String custAlternateNumber
	String custEmail
	String custAddress
	String custAddress2
	String custCity
	String custState
	String custZip
	
	String vehicleYear
	String vehicleMake
	String vehicleModel
	String vehicleVin
	
	static hasMany = [glassTypes: GlassType, options: GlassOption]
	
	Date insuranceDateOfLoss
	String insuranceCompany
	String insurancePolicyNumber
	String insuranceClaimNumber
	String insuranceDeductible
	
	Date installDate
	String installTime
	String installLocation
	String installCrossStreet1
	String installCrossStreet2
	String installAddress
	String installCity
	
	String notes
	
	String sig
	
	Date dateCreated	
	
	static constraints = {
		
		jobType inList: ["Install","Repair","Warranty","Tint"], blank: false
		custFirstName blank: false
		custLastName blank: false
		custBestNumber blank: false, size:10..10
		custAlternateNumber nullable: true, sizeMax: 10
		custEmail blank: false, email: true
		custAddress blank: false
		custAddress2 nullable: true
		custCity blank: false
		custState blank: false, size: 2..2
		custZip blank:false, size: 5..5
		 
		vehicleYear blank: false, size:4..4
		vehicleMake blank: false
		vehicleModel blank: false
		vehicleVin blank: false, size:17..17

		glassTypes blank: false
		options blank: false

		insuranceDateOfLoss nullable: true
		insuranceCompany nullable: true
		insurancePolicyNumber nullable: true
		insuranceClaimNumber nullable: true
		insuranceDeductible nullable: true

		installDate blank: false
		installTime InList: ["Morning","Mid Day","Afternoon"], blank: false
		installLocation InList: ["In Shop","Home","Business"], blank: false
		installCrossStreet1 blank: false
		installCrossStreet2 blank: false
		installAddress nullable: true
		installCity nullable: true
				
		paymentType InList: ["Insurance","Cash"], blank: false
		claimStatus InList: ["Pending","Approved"], nullable: true
		orderStatus InList: ["In Queue","Processed","Completed"], nullable: true
		orderId nullable: true, unique: true
		notes nullable: true, size:0..1024	
		
		sig nullable: true, maxSize: 1048567
		
		//NULLABLE FOR VALIDATION TO WORK PROPERLY
		secUser nullable: true	
	}
	
	String toString() { return id }
	
}
