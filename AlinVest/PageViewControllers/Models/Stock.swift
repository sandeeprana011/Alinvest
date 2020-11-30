//
//  Stock.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import Foundation

class Stock {
	var name:String?
	var icon:String?
	var percent:Double?
	var stockType:String?
	
	func percentDescription() -> String? {
		if let perc = percent {
			if perc > 0 {
				return "+\(perc)%"
			} else if perc < 0{
				return "\(perc.description)%" 
			} else {
				return ""
			}
		}else {
			return nil
		}
		
	}
}
