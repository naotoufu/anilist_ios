//
//  SearchDetailYearTableViewCellDelegate.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/25.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import UIKit

protocol SearchDetailYearTableViewCellDelegate : class {
    func valueChanged(_ sender: UISlider, cell: SearchDetailYearTableViewCell)
}
