//
//  CellTrendingStocks.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import UIKit


class CellTrendingStock: UITableViewCell {
	let stackView = UIStackView(forAutoLayout: ())
	func updateCell(stock:Stock?)  {
		
		stackView.arrangedSubviews.forEach { (view) in
			view.removeFromSuperview()
		}
		
		stackView.axis = .horizontal
		stackView.distribution = .fill
		stackView.alignment = .center;
		stackView.spacing = 10
		
		let iStockIcon = UIImageView(image: UIImage(named: stock?.icon ?? ""));
		
		let width = 45
		iStockIcon.autoSetDimensions(to: CGSize(width: width, height: width))
		iStockIcon.layer.cornerRadius = CGFloat(width / 2)
		iStockIcon.clipsToBounds = true
		
		stackView.addArrangedSubview(iStockIcon);
		
		let lTitleStock = UILabel(forAutoLayout: ())
		lTitleStock.text = stock?.name ?? ""
		lTitleStock.font = UIFont.boldSystemFont(ofSize: 16)
		
		let lStockType = UILabel(forAutoLayout: ())
		lStockType.font = UIFont.systemFont(ofSize: 14)
		lStockType.textColor = .gray
		lStockType.text = stock?.stockType ?? ""
		
		let stackLabels = UIStackView(arrangedSubviews: [lTitleStock,lStockType])
		stackLabels.axis = .vertical
		stackLabels.distribution = .equalSpacing
		stackLabels.spacing = 2
		stackView.addArrangedSubview(stackLabels)
		
		let lChangeInPercent = UILabel(forAutoLayout: ());
		lChangeInPercent.text = "\(stock?.percentDescription() ?? "")"
		lChangeInPercent.font = UIFont.boldSystemFont(ofSize: 13);
		lChangeInPercent.textColor = .white
		
		switch stock?.percent ?? 0.0 {
		case let x where x > 0:
			lChangeInPercent.backgroundColor = #colorLiteral(red: 0.241068244, green: 0.8594331145, blue: 0.705801785, alpha: 1)
			break;
		case let x where x < 0:
			lChangeInPercent.backgroundColor = #colorLiteral(red: 0.9908463359, green: 0.4157002866, blue: 0.4209897518, alpha: 1)
			break;
		default:
			lChangeInPercent.backgroundColor = .gray
		}
		lChangeInPercent.clipsToBounds = true
		lChangeInPercent.layer.cornerRadius = 10
		
		lChangeInPercent.autoSetDimension(.width, toSize: 70)
		lChangeInPercent.autoSetDimension(.height, toSize: 20)
		lChangeInPercent.textAlignment = .center
		
		
		stackView.addArrangedSubview(lChangeInPercent)
		
		self.contentView.addSubview(stackView)
//		stackView.autoMatch(.width, to: .width, of: self.contentView)
		stackView.autoPinEdge(toSuperviewEdge: .left)
		stackView.autoCenterInSuperview()
		stackView.autoPinEdge(toSuperviewEdge: .right)
		stackView.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
		stackView.isLayoutMarginsRelativeArrangement = true
//		
	}
}
