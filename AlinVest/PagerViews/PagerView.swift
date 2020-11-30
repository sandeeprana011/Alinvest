//
//  PagerView.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import UIKit


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

