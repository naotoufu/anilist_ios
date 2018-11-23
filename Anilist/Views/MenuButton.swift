//
//  MenuButton.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/24.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MenuButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 4.0
        
        layer.shadowRadius = 4.0
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setTitle("MENU", for: .normal)
    }
    
}
