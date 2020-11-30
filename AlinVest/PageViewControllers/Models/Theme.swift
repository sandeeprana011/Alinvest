//
//  Theme.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import Foundation

class Theme {
	static var dummyData:[Theme] {
		let theme:Theme = Theme()
		theme.name = "Diversity & Inclusion"
		theme.icon = "Diversity & Inclusion"
		
		let themeBT:Theme = Theme()
		themeBT.name = "Bold Biotech"
		themeBT.icon = "Bold Biotech"
		
		let themeCrypto:Theme = Theme()
		themeCrypto.name = "Crypto Central"
		themeCrypto.icon = "Crypto Central"
		
		let themeShe:Theme = Theme()
		themeShe.name = "She runs it"
		themeShe.icon = "She runs it"
		
		let themeClean:Theme = Theme()
		themeClean.name = "Clean & Green"
		themeClean.icon = "Clean & Green"
		
		let themeCannabis:Theme = Theme()
		themeCannabis.name = "Cannabis-ness"
		themeCannabis.icon = "Cannabis-ness"
		
		let themePowerIt:Theme = Theme()
		themePowerIt.name = "Power it"
		themePowerIt.icon = "Pinterest"
		
		let themeFoodie:Theme = Theme()
		themeFoodie.name = "Foodie Run"
		themeFoodie.icon = "Slack Technologies"
		
		let themeArt:Theme = Theme()
		themeArt.name = "Art & Fashion"
		themeArt.icon = "Art & Fashion"
		
		let themeHome:Theme = Theme()
		themeHome.name = "Home is where the heart is"
		themeHome.icon = "Home"
		
		
		return [theme,themeBT,themeCrypto,themeShe,themeClean,themeCannabis,themePowerIt,themeFoodie,themeArt,themeHome] 
	}
	
	
	
	var name:String?
	var icon:String?
}
