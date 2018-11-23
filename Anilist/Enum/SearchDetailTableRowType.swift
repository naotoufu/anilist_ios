//
//  SearchDetailTableType.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/23.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation

enum SearchDetailTableRowType: Int, CaseIterable {
    case type
    case season
    case year
    case filter
    case advance
    
    var string : String {
        switch self {
        case .type:
            return "TYPE"
        case .season:
            return "SEASON"
        case .year:
            return "YEAR"
        case .filter:
            return  "FILTER"
        case .advance:
            return "ADVANCE"
        }
    }
}
