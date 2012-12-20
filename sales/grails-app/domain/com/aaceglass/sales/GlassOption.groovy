package com.aaceglass.sales

class GlassOption {
	String name

    static constraints = {
		name blank: false
    }
	
	String toString() { return name }
}
