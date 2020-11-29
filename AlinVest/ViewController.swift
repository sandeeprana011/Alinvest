//
//  ViewController.swift
//  AlinVest
//
//  Created by Sandeep Rana on 29/11/20.
//

import UIKit
import PureLayout

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		let rootStackView = UIStackView(forAutoLayout: ())
		rootStackView.axis = .vertical
//		stackView.addArrangedSubview(label)
		rootStackView.alignment = .fill
		self.view.addSubview(rootStackView)
		
		let windowInsets = UIApplication.shared.windows.first?.safeAreaInsets
		rootStackView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: windowInsets?.top ?? 0, left: 0, bottom: windowInsets?.bottom ?? 0, right: 0))
		
		do { //#MARK: adding header 
			let stackViewHeader = UIStackView(forAutoLayout: ())
			let bMenu = UIButton(forAutoLayout: ())
			bMenu.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
			bMenu.setContentHuggingPriority(.defaultHigh, for: .horizontal)
			bMenu.tintColor = .black
			
			let lTitle = UILabel(forAutoLayout: ())
			lTitle.text = "Explore"
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
			
			rootStackView.addArrangedSubview(stackViewHeader)
			
		}
		
		
		
		do { //#MARK: Adding Page Title view
			let pagerHeader = PagerHeader(forAutoLayout: ())
			pagerHeader.setTitles(titles: ["Category","Themes","Trending"]);
			rootStackView.addArrangedSubview(pagerHeader)
			
		}
		
		do { //#MARK: Adding Pager ScrollView
			
			let vcTrending = TrendingViewController()
			let vcTrending2 = TrendingViewController()
			let vcTrending3 = TrendingViewController()
			let pager = PagerView(forAutoLayout: ())
			pager.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
			pager.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
			rootStackView.addArrangedSubview(pager);
			pager.addPages(views: [vcTrending.view,vcTrending2.view,vcTrending3.view]);
			
		}
		
		do { //#MARK: Adding Bottom Navigator
			let bottomNavigator = BottomNavigatorView()
			rootStackView.addArrangedSubview(bottomNavigator)
			bottomNavigator.addButtons(items: [NavItem(icon: "house"), NavItem(icon: "magnifyingglass"), NavItem(icon: "person.circle")])
			
		}
		
		
		
	}
}

class NavItem {
//	var title:String?
	var icon:String?
	init(icon:String) {
		self.icon = icon;
	}
}

class BottomNavigatorView: UIStackView {
	
	
	
	func addButtons(items:[NavItem]) {
//		let stackView = UIStackView(forAutoLayout: ())
		self.axis = .horizontal
		self.distribution = .fillEqually
		items.forEach { (item) in
			let button = UIButton(forAutoLayout: ())
			button.setImage(UIImage(systemName: item.icon ?? ""), for: .normal);
			self.addArrangedSubview(button)
		}
	}
}

class PagerView: UIScrollView {
	func addPages(views:[UIView]) {
		let stackView = UIStackView(forAutoLayout: ())
		let widthScreen = UIApplication.shared.windows.first?.frame.width ?? 0.0
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.axis = .horizontal;
		stackView.setContentHuggingPriority(.defaultLow, for: .vertical)
		
		views.forEach { (view) in
			stackView.addArrangedSubview(view);
			view.widthAnchor.constraint(equalToConstant: widthScreen).isActive = true
		}
		self.addSubview(stackView)
		self.isPagingEnabled = true
		
		let width:CGFloat = widthScreen * CGFloat(views.count);
		self.contentSize = CGSize(width: width, height: self.contentSize.height)
	}
}


class PagerHeader: UIStackView {
	
	
	@objc func onTitleClicked(_ sender:UIButton)  {
		self.arrangedSubviews.forEach { (view) in
			(view as? UIButton)?.isSelected = false;
		}
		sender.isSelected = true
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
			button.addTarget(self, action: #selector(self.onTitleClicked(_:)), for: .touchUpInside);
			
			if index != 0 {
				let labelDivider = UILabel(forAutoLayout: ())
				labelDivider.text = "|"
				labelDivider.textColor = .lightGray
				labelDivider.setContentHuggingPriority(.defaultHigh, for: .horizontal)
				self.addArrangedSubview(labelDivider);
			}
			
			self.addArrangedSubview(button)
			
		}
		
		self.alignment = .fill
		self.distribution = .equalCentering

	}
}
