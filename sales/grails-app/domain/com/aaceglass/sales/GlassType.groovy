package com.aaceglass.sales

class GlassType {
	String name

    static constraints = {
		name blank: false
    }
	
	String toString() { return name }
}
