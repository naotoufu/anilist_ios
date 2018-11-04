//
//  PageInfo.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/04.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation

struct PageInfo {
    var total: Int = 0
    var perPage: Int = 0
    var currentPage: Int = 0
    var lastPage: Int = 0
    var hasNextPage: Bool = false
    
    init() {
        
    }
    
    init(graphQLpageInfo: MediaSearchQuery.Data.Page.PageInfo) {
        if let total = graphQLpageInfo.total {
            self.total = total
        }
        if let perPage = graphQLpageInfo.perPage {
            self.perPage = perPage
        }
        if let currentPage = graphQLpageInfo.currentPage {
            self.currentPage = currentPage
        }
        if let lastPage = graphQLpageInfo.lastPage {
            self.lastPage = lastPage
        }
        if let hasNextPage = graphQLpageInfo.hasNextPage {
            self.hasNextPage = hasNextPage
        }
    }
}
