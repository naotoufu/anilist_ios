//
//  MediaModel.swift
//  Anilist
//
//  Created by NaotoIto on 2018/10/27.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import Apollo

class MediaModel: NSObject {
    typealias MediaList = MediaSearchQuery.Data.Page
    
    let apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
    var medias = [MediaList?]()
    
    func fetch(page: Int, seasonYear: Int, season:MediaSeason?, complition: @escaping (MediaList?)->Void) {
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
            self.medias.append(result?.data?.page)
            complition(result?.data?.page)
//            print(result?.data?.page) // Luke Skywalker
        }
//        apollo.fetch(query: MediaQuery(page: page, seasonYear: seasonYear, season: season)) { (result, error) in
//        }
    }
}
