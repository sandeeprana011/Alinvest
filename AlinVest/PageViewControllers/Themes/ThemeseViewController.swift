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
