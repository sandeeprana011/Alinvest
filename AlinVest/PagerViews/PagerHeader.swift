//
//  PagerHeader.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import UIKit


class PagerHeader: UIStackView {
	
	func onPageMoved(index:Int){
		self.arrangedSubviews.forEach { (view) in
			(view as? UIButton)?.isSelected = false;
		}
		(self.arrangedSubviews.filter { (view) -> Bool in
			return view is UIButton
		}[index] as? UIButton)?.isSelected = true
	}
	
	var onTitleClickedCallback: ((_ index:Int) -> Void)?;
	
	@objc func onTitleClicked(_ sender:UIButton)  {
		self.arrangedSubviews.forEach { (view) in
			(view as? UIButton)?.isSelected = false;
		}
		sender.isSelected = true
		self.onTitleClickedCallback?(sender.tag)
	}
	
	func setTitles(titles:[String]) {
		self.arrangedSubviews.forEach { (view) in
			view.removeFromSuperview()
		}
		
		for (index,title) in titles.enumerated() {
			let button = UIButton(forAutoLayout: ())
			button.setTitle(title, for: .normal)
			button.setTitleColor(.black, for: .normal)
			button.setTitleColor(.systemIndigo, for: .selected)
			button.tag = index;
			button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
			button.addTarget(self, action: #selector(self.onTitleClicked(_:)), for: .touchUpInside);
			
			if index != 0 {
				let labelDivider = UILabel(forAutoLayout: ())
				labelDivider.text = "|"
				labelDivider.textColor = .lightGray
				labelDivider.setContentHuggingPriority(.defaultHigh, for: .horizontal)
				self.addArrangedSubview(labelDivider);
			}
			
			self.addArrangedSubview(button)
			
			self.onPageMoved(index: 0)
			
		}
		
		self.alignment = .fill
		self.distribution = .equalCentering

	}
}
