//
//  TrendingViewController.swift
//  AlinVest
//
//  Created by Sandeep Rana on 29/11/20.
//

import UIKit

class TrendingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		let label = UILabel(forAutoLayout: ())
		label.text = "fucing kdjfkl"
		label.backgroundColor = .yellow
		self.view.addSubview(label)
		label.coverWholeSuperview()
    }
}
