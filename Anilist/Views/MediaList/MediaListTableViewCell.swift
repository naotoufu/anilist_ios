//
//  MediaListTableViewCell.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/12.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MediaListTableViewCell: UITableViewCell {
    
    static let identifier = "\(MediaListTableViewCell.self)"

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        coverImageView.contentMode = .scaleAspectFit
        coverImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(title: String, text: String, url: URL, complition: @escaping ()->Void) {
        coverImageView.load(url: url, complition: complition)
        titleLabel.text = title
        textView.text = text
    }
    
}
