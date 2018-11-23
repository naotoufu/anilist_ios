//
//  SearchDetailType.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/23.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
enum SearchDetailType: Int , CaseIterable {
    case anime
    case manga
    case studio
    case charactors
    case staff
    
    var string : String {
        switch self {
        case .anime:
            return "ANIME"
        case .manga:
            return "MANGA"
        case .studio:
            return "STUDIO"
        case .charactors:
            return  "CHARACTORS"
        case .staff:
            return "STAFF"
        }
    }
}
