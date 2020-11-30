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

class RowCategory: UIView {
	
	let icon:UIImageView = UIImageView(forAutoLayout: ())
	let lTitle:UILabel = UILabel(forAutoLayout: ())
	let stackHorizontal:UIStackView = UIStackView(forAutoLayout: ())
	
	
	func setupView(name:String,icon:String,backgroundColor:UIColor) {
		self.icon.image = UIImage(systemName: icon)
		self.lTitle.text = name
		self.lTitle.textColor = .white
		
		self.stackHorizontal.distribution = .fill
		self.stackHorizontal.addArrangedSubview(self.icon)
		self.stackHorizontal.addArrangedSubview(self.lTitle)
		self.stackHorizontal.spacing = 20
		
		self.icon.autoSetDimensions(to: CGSize(width: 45, height: 45));
		self.icon.tintColor = .white
		
		self.addSubview(stackHorizontal)
		stackHorizontal.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 20, left: 30, bottom: 20, right: 30))
		
//		self.autoSetDimensions(to: CGSize(width: stackHorizontal.frame.width, height: stackHorizontal.frame.height))
		
		
		self.layer.cornerRadius = 40
		self.layer.cornerCurve = .continuous
		self.backgroundColor = backgroundColor
	}
}
