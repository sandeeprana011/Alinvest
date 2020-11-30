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


