//
//  NavigationView.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import UIKit

class BottomNavigatorView: UIStackView {
	@objc func onClickTabItem(_ sender:UIButton)  {
		self.arrangedSubviews.forEach { (view) in
			(view as? UIButton)?.isSelected = false
		}
		sender.isSelected = true;
		self.updateAllButtons();
	}
	
	func updateAllButtons()  {
		self.arrangedSubviews.forEach { (view) in
			if let button = (view as? UIButton) {
				if button.isSelected {
					button.tintColor = .white
					button.backgroundColor = .systemBlue
				}else {
					button.tintColor = .systemBlue
					button.backgroundColor = .white
				}
			}
		}
	}
	
	func addButtons(items:[NavItem]) {
//		let stackView = UIStackView(forAutoLayout: ())
		self.axis = .horizontal
		self.distribution = .fillEqually
		items.forEach { (item) in
			let button = UIButton(forAutoLayout: ())
			button.setImage(UIImage(systemName: item.icon ?? ""), for: .normal);
			button.addTarget(self, action: #selector(self.onClickTabItem(_:)), for: .touchUpInside)
			self.addArrangedSubview(button)
		}
	}
}
