//
//  TrendingViewController.swift
//  AlinVest
//
//  Created by Sandeep Rana on 29/11/20.
//

import UIKit

class TrendingViewController: UIViewController {

	var stocksRoot:StocksRoot? = StocksRoot.dummyData
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.setupTableView()
	}
	
	
	var tableView:UITableView!
	
    func setupTableView() {
		self.tableView = UITableView(frame: self.view.frame, style: .grouped)
		tableView.register(CellTrendingStock.self, forCellReuseIdentifier: "cell")
		
		tableView.delegate = self;
		tableView.backgroundColor = .white
		tableView.dataSource = self;
		self.view.addSubview(tableView)
		tableView.reloadData()
		self.tableView.showsVerticalScrollIndicator = false
		tableView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
		tableView.autoPinEdgesToSuperviewEdges()
		
    }
}

extension TrendingViewController: UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTrendingStock
		let stock = self.stocksRoot?.stockTrendTypes?[indexPath.section].stocks?[indexPath.row]
		cell.updateCell(stock: stock)	
		return cell
	}
	
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return stocksRoot?.stockTrendTypes?.count ?? 0 
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.stocksRoot?.stockTrendTypes?[section].stocks?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}
	
	
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let stack = UIStackView()
		
		stack.alignment = .fill
		stack.distribution = .fill
		
		let label = UILabel(frame: CGRect(origin: tableView.frame.origin, size: CGSize(width: 100, height: 30)));
		label.text = self.stocksRoot?.stockTrendTypes?[section].trendName ?? ""
		label.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
		label.heightAnchor.constraint(equalToConstant: 30).isActive = true
		label.textAlignment = .left
		label.font = UIFont.boldSystemFont(ofSize: 16)
		stack.addArrangedSubview(label)
		stack.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
		stack.isLayoutMarginsRelativeArrangement = true
		return stack
	}
	
	
}

class CellTrendingStock: UITableViewCell {
	let stackView = UIStackView(forAutoLayout: ())
	func updateCell(stock:Stock?)  {
		
		stackView.arrangedSubviews.forEach { (view) in
			view.removeFromSuperview()
		}
		
		stackView.axis = .horizontal
		stackView.distribution = .fill
		stackView.alignment = .center;
		stackView.spacing = 10
		
		let iStockIcon = UIImageView(image: UIImage(named: stock?.icon ?? ""));
		
		let width = 45
		iStockIcon.autoSetDimensions(to: CGSize(width: width, height: width))
		iStockIcon.layer.cornerRadius = CGFloat(width / 2)
		iStockIcon.clipsToBounds = true
		
		stackView.addArrangedSubview(iStockIcon);
		
		let lTitleStock = UILabel(forAutoLayout: ())
		lTitleStock.text = stock?.name ?? ""
		lTitleStock.font = UIFont.boldSystemFont(ofSize: 16)
		
		let lStockType = UILabel(forAutoLayout: ())
		lStockType.font = UIFont.systemFont(ofSize: 14)
		lStockType.textColor = .gray
		lStockType.text = stock?.stockType ?? ""
		
		let stackLabels = UIStackView(arrangedSubviews: [lTitleStock,lStockType])
		stackLabels.axis = .vertical
		stackLabels.distribution = .equalSpacing
		stackLabels.spacing = 2
		stackView.addArrangedSubview(stackLabels)
		
		let lChangeInPercent = UILabel(forAutoLayout: ());
		lChangeInPercent.text = "\(stock?.percentDescription() ?? "")"
		lChangeInPercent.font = UIFont.boldSystemFont(ofSize: 13);
		lChangeInPercent.textColor = .white
		
		switch stock?.percent ?? 0.0 {
		case let x where x > 0:
			lChangeInPercent.backgroundColor = #colorLiteral(red: 0.241068244, green: 0.8594331145, blue: 0.705801785, alpha: 1)
			break;
		case let x where x < 0:
			lChangeInPercent.backgroundColor = #colorLiteral(red: 0.9908463359, green: 0.4157002866, blue: 0.4209897518, alpha: 1)
			break;
		default:
			lChangeInPercent.backgroundColor = .gray
		}
		lChangeInPercent.clipsToBounds = true
		lChangeInPercent.layer.cornerRadius = 10
		
		lChangeInPercent.autoSetDimension(.width, toSize: 70)
		lChangeInPercent.autoSetDimension(.height, toSize: 20)
		lChangeInPercent.textAlignment = .center
		
		
		stackView.addArrangedSubview(lChangeInPercent)
		
		self.contentView.addSubview(stackView)
//		stackView.autoMatch(.width, to: .width, of: self.contentView)
		stackView.autoPinEdge(toSuperviewEdge: .left)
		stackView.autoCenterInSuperview()
		stackView.autoPinEdge(toSuperviewEdge: .right)
		stackView.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
		stackView.isLayoutMarginsRelativeArrangement = true
//		
	}
}


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

class TrendType {
	var trendName:String?
	var stocks:[Stock]?
}

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
