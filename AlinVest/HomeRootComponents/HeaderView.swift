//
//  HeaderView.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import UIKit


class HeaderView: UIStackView {
	func setHeaderViewAndTitle(title:String) {
		let stackViewHeader = self
		let bMenu = UIButton(forAutoLayout: ())
		bMenu.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
		bMenu.setContentHuggingPriority(.defaultHigh, for: .horizontal)
		bMenu.tintColor = .black
		
		let lTitle = UILabel(forAutoLayout: ())
		lTitle.text = title
		lTitle.setContentHuggingPriority(.defaultLow, for: .horizontal)
		lTitle.textAlignment = .center
		lTitle.font = UIFont.boldSystemFont(ofSize: 18)
		
		let bBellNotification = UIButton(forAutoLayout: ())
		bBellNotification.setImage(UIImage(systemName: "bell"), for: .normal)
		bBellNotification.setContentHuggingPriority(.defaultHigh, for: .horizontal)
		bBellNotification.tintColor = .black
		
		stackViewHeader.addArrangedSubview(bMenu)
		stackViewHeader.addArrangedSubview(lTitle)
		stackViewHeader.addArrangedSubview(bBellNotification)
	}
}

