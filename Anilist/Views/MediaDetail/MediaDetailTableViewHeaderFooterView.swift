//
//  MediaDetailTableViewHeaderFooterView.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/11.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MediaDetailTableViewHeaderFooterView: UITableViewHeaderFooterView {
    static let identifier = "\(Swift.type(of: self))"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(_ text: String?) {
        textLabel?.text = text
    }
}
