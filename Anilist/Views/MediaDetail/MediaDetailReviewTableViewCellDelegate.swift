//
//  MediaDetailReviewTableViewCellDelegate.swift
//  Anilist
//
//  Created by NaotoIto on 2018/12/05.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
protocol MediaDetailReviewTableViewCellDelegate : class {
    func touchesBegan(cell: MediaDetailReviewTableViewCell)
}
