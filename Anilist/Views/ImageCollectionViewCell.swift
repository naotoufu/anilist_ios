//
//  ImageCollectionViewCell.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/04.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier : String = "\(ImageCollectionViewCell.self)"
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 4.0
    }
    
    func configure(imageUrlString: String, complition: @escaping ()->Void) {
        guard let url = URL(string: imageUrlString) else {return}
        self.imageView.load(url: url, complition: complition)
    }
}
