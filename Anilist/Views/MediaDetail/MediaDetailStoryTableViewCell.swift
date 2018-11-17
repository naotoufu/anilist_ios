//
//  MediaDetailStoryTableViewCell.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/11.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MediaDetailStoryTableViewCell: UITableViewCell {
    
    static let identifier = "\(MediaDetailStoryTableViewCell.self)"

    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.isScrollEnabled = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(text: String?) {
        textView.text = text
        textView.sizeToFit()
    }
    
}
