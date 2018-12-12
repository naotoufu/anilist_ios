//
//  MediaDetailTableViewSectionType.swift
//  Anilist
//
//  Created by NaotoIto on 2018/12/02.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
enum MediaDetailTableViewSectionType : Int , CaseIterable {
    case story, reviews, relations, traier, thread
    
    var sectionTitle : String {
        switch self {
        case .story:
            return "Story"
        case .reviews:
            return "Reviews"
        case .relations:
            return "Relations"
        case .traier:
            return "Traier"
        case .thread:
            return "Thread"
        }

    }
}
