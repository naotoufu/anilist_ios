//
//  ScrollableUIControlTableView.swift
//  Anilist
//
//  Created by NaotoIto on 2018/12/01.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import UIKit
class ScrollableUIControlTableView: UITableView {
    override func touchesShouldCancel(in view: UIView) -> Bool {
        return true
    }
//    override func touchesShouldCancel(in view: UIView) -> Bool {
//        if view is UIControl
//            && !(view is UITextInput)
//            && !(view is UISlider)
//            && !(view is UISwitch) {
//            return true
//        }
//
//        return super.touchesShouldCancel(in: view)
//    }
}
