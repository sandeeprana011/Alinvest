//
//  ViewController.swift
//  AlinVest
//
//  Created by Sandeep Rana on 29/11/20.
//

import UIKit
import PureLayout

class ViewController: UIViewController {
	
	
	let vcTrending3 = TrendingViewController()
	let vcTrending2 = CategoryViewController()
	let vcTrending = ThemeseViewController()

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
			let headerView = HeaderView(forAutoLayout: ())
			rootStackView.addArrangedSubview(headerView)
			headerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
			headerView.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
			headerView.isLayoutMarginsRelativeArrangement = true
			headerView.setHeaderViewAndTitle(title:"Explore")
		}
		
		
		let pager = PagerView(forAutoLayout: ())
		let pagerHeader = PagerHeader(forAutoLayout: ())
		
		do { //#MARK: Adding Page Title view
			pagerHeader.setTitles(titles: ["Category","Themes","Trending"]);
			pagerHeader.heightAnchor.constraint(equalToConstant: 45).isActive = true
			pagerHeader.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
			pagerHeader.isLayoutMarginsRelativeArrangement = true
			pagerHeader.onTitleClickedCallback = { index in
				pager.scrollToPage(index:index);
			} 
			rootStackView.addArrangedSubview(pagerHeader)
			
		}
		
		do { //#MARK: Adding Pager ScrollView
			
			
			pager.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
			pager.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
			
			rootStackView.addArrangedSubview(pager);
			pager.addPages(views: [vcTrending.view,vcTrending2.view,vcTrending3.view]);
			pager.pagerHeader = pagerHeader;
			
		}
		
		do { //#MARK: Adding Bottom Navigator
			let bottomNavigator = BottomNavigatorView()
			rootStackView.addArrangedSubview(bottomNavigator)
			bottomNavigator.heightAnchor.constraint(equalToConstant: 70).isActive = true
			bottomNavigator.addButtons(items: [NavItem(icon: "house"), NavItem(icon: "magnifyingglass"), NavItem(icon: "person.circle"), NavItem(icon: "person.circle"), NavItem(icon: "person.circle")])
			
		}
		
		
		
	}
}
