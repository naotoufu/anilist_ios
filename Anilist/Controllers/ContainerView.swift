//
//  ContainerView.swift
//  Anilist
//
//  Created by NaotoIto on 2018/12/01.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import UIKit
class ContainerView: UIView {
    
    func addSubviewContainer(_ view: UIView) {
        addSubview(view)
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
