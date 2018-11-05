//
//  LoadingFooterView.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/04.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class LoadingFooterView: UITableViewHeaderFooterView {
    
    static let identifier = "\(LoadingFooterView.self)"
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
//    override func awakeFromNib() {
//        <#code#>
//    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
