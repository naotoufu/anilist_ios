//
//  MediaStatus.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/05.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
enum MediaStatus :String {
    // Has completed and is no longer being released
    case finished = "FINISHED"
    // Currently releasing
    case releasing = "RELEASING"
    // To be released at a later date
    case not_yet_released = "NOT_YET_RELEASED"
    // Ended before the work could be finished
    case cancelled = "CANCELLED"
}
