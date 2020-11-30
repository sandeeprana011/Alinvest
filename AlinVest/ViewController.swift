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

class NavItem {
//	var title:String?
	var icon:String?
	init(icon:String) {
		self.icon = icon;
	}
}

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


class PagerView: UIScrollView {
	
	var pagerHeader:PagerHeader?
	
	
	let widthScreen:CGFloat =  { return UIApplication.shared.windows.first?.frame.width ?? 0.0 }()
	
	func scrollToPage(index:Int) {
		self.setContentOffset(CGPoint(x: Int(widthScreen) * index, y: 0), animated: true)
	}
	
	
	func addPages(views:[UIView]) {
		
		self.delegate = self
		
		self.showsHorizontalScrollIndicator = false
		self.showsVerticalScrollIndicator = false
		
		let stackView = UIStackView(forAutoLayout: ())
		
		stackView.alignment = .fill
		stackView.distribution = .fillEqually
		stackView.axis = .horizontal;
		self.addSubview(stackView)
		
		views.forEach { (view) in
			stackView.addArrangedSubview(view);
			view.widthAnchor.constraint(equalToConstant: widthScreen).isActive = true
			view.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
		}
		
		self.isPagingEnabled = true
		self.bounces = false
		self.isDirectionalLockEnabled = true
		
		let width:CGFloat = widthScreen * CGFloat(views.count);
		self.contentSize = CGSize(width: width, height: self.frame.height)
	}
}

extension PagerView:UIScrollViewDelegate {
	func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
		let page = scrollView.contentOffset.x / self.widthScreen;
		print(Int(page))
		self.pagerHeader?.onPageMoved(index:Int(page));
	}
}


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
