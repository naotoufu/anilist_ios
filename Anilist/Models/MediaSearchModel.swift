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
    typealias Page = MediaSearchQuery.Data.Page
    
    let apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
    var pageDataSet : [Page] = [Page]()
    
    var currentPageDataSet : Page {
        return pageDataSet[pageInfo.currentPage - 1]
    }
    
    // media, graphQL medium
    var media : [MediaSearchQuery.Data.Page.Medium?]? {
        return currentPageDataSet.media
    }
    
    var currentPage = 1
    
    var pageInfo : PageInfo {
        guard pageDataSet.count > 0 else {return PageInfo()}
        guard let pageInfo = pageDataSet[currentPage - 1].pageInfo else {return PageInfo()}
        return PageInfo(graphQLpageInfo: pageInfo)
    }

    var totalDisplayPage = 0
    
    func fetch(page: Int, seasonYear: Int, season:MediaSeason?, complition: @escaping (Page)->Void) {
        currentPage = page
//        let id : Int! = 100182
//        MediaSearchQuery.init(page: page, seasonYear: seasonYear, season: season)
//        apollo.watch(query: MediaSearchQuery(page: page, seasonYear: seasonYear)) { (result, error)
//            in
//            print(result?.data?.page)
//        }
        apollo.fetch(query: MediaSearchQuery(page: page, seasonYear: seasonYear)) { [weak self] (result, error)
            in
            guard let `self` = self else { return }
            if let _ = error {return}
            guard let page = result?.data?.page else {return}
            self.pageDataSet.append(page)
            if self.currentPage != self.pageInfo.lastPage {self.totalDisplayPage += self.pageInfo.perPage}
            complition(page)
//            print(result?.data?.page) // Luke Skywalker
        }
//        apollo.fetch(query: MediaQuery(page: page, seasonYear: seasonYear, season: season)) { (result, error) in
//        }
    }
}
