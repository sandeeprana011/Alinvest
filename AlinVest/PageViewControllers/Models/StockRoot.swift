//
//  StockRoot.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import Foundation

class StocksRoot {
	
	static var dummyData:StocksRoot {  
		let stock = StocksRoot()
		
		let stockMedifest = Stock()
		stockMedifest.name = "Medifast"
		stockMedifest.icon = "Medifast"
		stockMedifest.percent = 50.78
		stockMedifest.stockType = "MEDI"
		
		
		let stockPinterest = Stock()
		stockPinterest.name = "Pinterest"
		stockPinterest.icon = "Pinterest"
		stockPinterest.percent = -4.77
		stockPinterest.stockType = "PINS"
		
		
		let stockSlackTechnologies = Stock()
		stockSlackTechnologies.name = "Slack Technologies"
		stockSlackTechnologies.icon = "Slack Technologies"
		stockSlackTechnologies.percent = -5.90
		stockSlackTechnologies.stockType = "WORK"
		
		
		let stockEvoquaWater = Stock()
		stockEvoquaWater.name = "Evoqua Water"
		stockEvoquaWater.icon = "Evoqua Water"
		stockEvoquaWater.percent = -5.99
		stockEvoquaWater.stockType = "AQUA"
		
		
		let topGainers = TrendType()
		topGainers.trendName = "Top Gainers"
		topGainers.stocks = [stockMedifest,stockPinterest,stockSlackTechnologies,stockEvoquaWater]
		
		let topSellers = TrendType()
		topSellers.trendName = "Top Sellers"
		topSellers.stocks = [stockMedifest,stockPinterest,stockSlackTechnologies,stockEvoquaWater]
		
		stock.stockTrendTypes = [topGainers,topSellers]
		
		return stock
	}
	
	var stockTrendTypes:[TrendType]?	
}
