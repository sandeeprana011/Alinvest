//
//  CategoryViewController.swift
//  AlinVest
//
//  Created by Sandeep Rana on 29/11/20.
//

import UIKit

class CategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		let stackView = UIStackView(forAutoLayout: ())
		self.view.addSubview(stackView)
		
		
		stackView.axis = .vertical
		stackView.distribution = .equalSpacing
		stackView.spacing = 20
		stackView.alignment = .fill
		
		
		let rowStocks = RowCategory(forAutoLayout: ())
		stackView.addArrangedSubview(rowStocks)
		rowStocks.setupView(name: "Stocks", icon: "leaf.arrow.circlepath",backgroundColor: #colorLiteral(red: 0.6472062469, green: 0.6449537277, blue: 0.9931876063, alpha: 1))
		
		let rowEtf = RowCategory(forAutoLayout: ())
		stackView.addArrangedSubview(rowEtf)
		rowEtf.setupView(name: "ETFs", icon: "grid.circle",backgroundColor: #colorLiteral(red: 0.3045174778, green: 0.3092995286, blue: 0.8133149147, alpha: 1))
		
		let rowCrypto = RowCategory(forAutoLayout: ())
		stackView.addArrangedSubview(rowCrypto)
		rowCrypto.setupView(name: "Crypto", icon: "bitcoinsign.circle",backgroundColor: #colorLiteral(red: 0.9978283048, green: 0.8429358006, blue: 0.2411904335, alpha: 1))
		
		stackView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 40)
		stackView.autoPinEdge(.right, to: .right, of: self.view,withOffset: -40)
		stackView.autoPinEdge(.top, to: .top, of: self.view, withOffset: 20)
		
		
		
//		stackView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
		
		
		
		
    }
	

}
