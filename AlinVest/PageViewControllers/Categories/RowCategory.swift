//
//  RowCategory.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import UIKit


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
