//
//  ThemeseViewController.swift
//  AlinVest
//
//  Created by Sandeep Rana on 30/11/20.
//

import UIKit

class ThemeseViewController: UIViewController {

	var collectionView:UICollectionView!
	
	var stockThemes:[Theme]? = Theme.dummyData
	var cellWidth:CGFloat = (UIScreen.main.bounds.width / 2) - 30
	
    override func viewDidLoad() {
        super.viewDidLoad()
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
		layout.itemSize = CGSize(width: self.cellWidth, height: self.cellWidth)
		self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
		self.collectionView.backgroundColor = .white
//		self.collectionView.setCollectionViewLayout(layout, animated: true)
		self.view.addSubview(self.collectionView)
		
		self.collectionView.heightAnchor.constraint(equalToConstant: self.view.frame.height).isActive = true
		
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.showsVerticalScrollIndicator = false
		self.collectionView.register(CellThemesCollectionView.self, forCellWithReuseIdentifier: "collectionCell")
    }
    

}


extension ThemeseViewController:UICollectionViewDelegate,UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.stockThemes?.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CellThemesCollectionView
		let theme = self.stockThemes?[indexPath.row]
		cell.setupCell(theme: theme)
		return cell
	}
	
}

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


class Theme {
	static var dummyData:[Theme] {
		let theme:Theme = Theme()
		theme.name = "Diversity & Inclusion"
		theme.icon = "Diversity & Inclusion"
		
		let themeBT:Theme = Theme()
		themeBT.name = "Bold Biotech"
		themeBT.icon = "Bold Biotech"
		
		let themeCrypto:Theme = Theme()
		themeCrypto.name = "Crypto Central"
		themeCrypto.icon = "Crypto Central"
		
		let themeShe:Theme = Theme()
		themeShe.name = "She runs it"
		themeShe.icon = "She runs it"
		
		let themeClean:Theme = Theme()
		themeClean.name = "Clean & Green"
		themeClean.icon = "Clean & Green"
		
		let themeCannabis:Theme = Theme()
		themeCannabis.name = "Cannabis-ness"
		themeCannabis.icon = "Cannabis-ness"
		
		let themePowerIt:Theme = Theme()
		themePowerIt.name = "Power it"
		themePowerIt.icon = "Pinterest"
		
		let themeFoodie:Theme = Theme()
		themeFoodie.name = "Foodie Run"
		themeFoodie.icon = "Slack Technologies"
		
		let themeArt:Theme = Theme()
		themeArt.name = "Art & Fashion"
		themeArt.icon = "Art & Fashion"
		
		let themeHome:Theme = Theme()
		themeHome.name = "Home is where the heart is"
		themeHome.icon = "Home"
		
		
		return [theme,themeBT,themeCrypto,themeShe,themeClean,themeCannabis,themePowerIt,themeFoodie,themeArt,themeHome] 
	}
	
	
	
	var name:String?
	var icon:String?
}
