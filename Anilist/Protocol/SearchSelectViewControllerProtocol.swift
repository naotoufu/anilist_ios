//
//  SearchSelectViewControllerProtocol.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/23.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import UIKit

protocol SearchSelectViewControllerProtocol where Self : UIViewController {
    var bottomVC : SearchBottomToolViewController! {get set}
    var scpresenter : SearchConditionPresenter! {get set}
}
