//
//  SearchDetailSeasonType.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/23.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
enum SearchDetailSeasonType: Int, CaseIterable {
    /// Months December to February
    case winter
    /// Months March to May
    case spring
    /// Months June to August
    case summer
    /// Months September to November
    case fall
    
    var string : String {
        switch self {
        case .winter:
            return "WINTER"
        case .spring:
            return "SPRING"
        case .summer:
            return "SUMMER"
        case .fall:
            return "FALL"
        }
    }

}
