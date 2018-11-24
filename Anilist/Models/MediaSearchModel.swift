//
//  MediaSearchModel.swift
//  Anilist
//
//  Created by NaotoIto on 2018/10/27.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import Apollo

class MediaSearchModel: NSObject {
    typealias PageData = MediaSearchQuery.Data.Page
    
    let apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
    var pageDataSet : [PageData] = [PageData]()
    
    var currentPageDataSet : PageData {
        return pageDataSet[pageInfo.currentPage - 1]
    }
    
    // media, graphQL medium
    var medias : [MediaSearchQuery.Data.Page.Medium?]? {
        return currentPageDataSet.media
    }
    
    var currentPage = 1
    
    var pageInfo : PageInfo {
        guard pageDataSet.count > 0 else {return PageInfo()}
        guard let pageInfo = pageDataSet[currentPage - 1].pageInfo else {return PageInfo()}
        return PageInfo(graphQLpageInfo: pageInfo)
    }

    
    func fetch(page: Int = 1, seasonYear: Int, season:MediaSeason?, complition: @escaping (PageData, PageInfo)->Void) {
        apollo.fetch(query: MediaSearchQuery(page: page, seasonYear: seasonYear, season: season)) { [weak self] (result, error)
            in
            guard let `self` = self else { return }
            if let _ = error {return}
            guard let pageData = result?.data?.page else {return}
            self.pageDataSet = [pageData]
            complition(pageData, self.pageInfo)
        }
    }
    
    func nextPageFetch(seasonYear: Int, season:MediaSeason?, complition: @escaping (PageData, PageInfo)->Void) {
        self.currentPage += 1
        apollo.fetch(query: MediaSearchQuery(page: currentPage, seasonYear: seasonYear, season: season)) { [weak self] (result, error)
            in
            guard let `self` = self else { return }
            if let _ = error {return}
            guard let pageData = result?.data?.page else {return}
            self.pageDataSet.append(pageData)
            complition(pageData, self.pageInfo)
        }
    }
}
