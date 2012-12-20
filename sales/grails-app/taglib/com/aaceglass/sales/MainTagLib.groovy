package com.aaceglass.sales

class MainTagLib {
	
	static namespace = "aace"
	
	def shortDate = { attrs ->
		out << g.formatDate(date: attrs.date, format: "dd MMM yyyy")
	}

}
