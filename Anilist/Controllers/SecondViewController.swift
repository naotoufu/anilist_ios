//
//  SecondViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/10/21.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let mediaSearchModel = MediaSearchModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: ImageCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        mediaSearchModel.fetch(page: 1, seasonYear: 2018, season: .spring) { [weak self] page in
            guard let `self` = self else {return}
            self.collectionView.reloadData()
            //            self.titleLabel.text = first?.fragments.mediaDetail.title?.native
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension SecondViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mediaSearchModel.totalDisplayPage
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell() }
        cell.configure(imageUrlString: mediaSearchModel.currentPageDataSet.media?[indexPath.row]?.fragments.mediaDetail.coverImage?.large ?? "") {
            cell.layoutIfNeeded()
        }
        return cell
    }
    
    
}
