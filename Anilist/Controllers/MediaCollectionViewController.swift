//
//  MediaCollectionViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/10/21.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MediaCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let mediaSearchModel = MediaSearchModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: ImageCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        mediaSearchModel.fetch(seasonYear: 2018, season: .spring) { [weak self] pageData, pageInfo in
            guard let `self` = self else {return}
            self.collectionView.reloadData()
            //            self.titleLabel.text = first?.fragments.mediaFgmt.title?.native
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

extension MediaCollectionViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mediaSearchModel.pageDataSet.first?.media?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell() }
        cell.configure(imageUrlString: mediaSearchModel.currentPageDataSet.media?[indexPath.row]?.fragments.mediaListFragment.coverImage?.large ?? "") {
            cell.layoutIfNeeded()
        }
        return cell
    }
    
    
}
