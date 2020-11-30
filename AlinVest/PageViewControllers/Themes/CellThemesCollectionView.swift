//
//  CellThemesCollectionView.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import UIKit

class CellThemesCollectionView: UICollectionViewCell {
	
	
	func setupCell(theme:Theme?) {
		let stack = UIStackView(forAutoLayout: ())
		
		stack.alignment = .center
		stack.axis = .vertical
		stack.distribution = .equalSpacing
		stack.spacing = 10
		
		let iTheme:UIImageView = UIImageView(forAutoLayout: ())
		iTheme.image = UIImage(named: theme?.icon ?? "")
		iTheme.contentMode = .scaleAspectFit
		
		
		let lTitle:UILabel = UILabel(forAutoLayout: ())
		lTitle.text = theme?.name ?? ""
		lTitle.numberOfLines = 0
		lTitle.font = UIFont.boldSystemFont(ofSize: 15)
		lTitle.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
		lTitle.setContentHuggingPriority(.defaultHigh, for: .vertical)
		lTitle.textAlignment  = .center
		
		stack.addArrangedSubview(iTheme)
		stack.addArrangedSubview(lTitle)
		self.contentView.addSubview(stack)
		
		iTheme.autoSetDimensions(to: CGSize(width: 120, height: 80))
		
		stack.autoPinEdgesToSuperviewMargins()
		self.layer.borderColor = #colorLiteral(red: 0.7588104606, green: 0.8680111766, blue: 0.863520503, alpha: 1).cgColor
		self.layer.borderWidth = 1
		self.layer.cornerRadius = 7
		self.layer.cornerCurve = .continuous
		self.backgroundColor = #colorLiteral(red: 0.9794242978, green: 0.984511435, blue: 0.9885719419, alpha: 1)
	}
}

