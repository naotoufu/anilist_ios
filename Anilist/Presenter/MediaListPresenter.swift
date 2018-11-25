//
//  FirstPresenter.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/05.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
class MediaListPresenter: NSObject {
    fileprivate weak var viewController : MediaListViewController!
    
    init(viewController: MediaListViewController){
        self.viewController = viewController
    }
    
    let mediaSearchModel = MediaSearchModel()
    
    var mediaFragments : [MediaListViewFragment] = [MediaListViewFragment]()
    
    var totalMediaFragments = 0
    
    var hasNextPage : Bool = false
    
    func fetch(type: SearchDetailType = .anime, seasonYear: Int, season: MediaSeason?, complition: @escaping ()->Void) {
        mediaSearchModel.fetch(type: type, seasonYear: seasonYear, season: season) { [weak self] pageData, pageInfo in
            guard let `self` = self else {return}
            guard let media = pageData.media else {return}
            self.hasNextPage = pageInfo.hasNextPage
            self.totalMediaFragments = pageInfo.hasNextPage ? pageInfo.perPage : pageInfo.total
            self.mediaFragments = media.compactMap({MediaListViewFragment(fragment: $0?.fragments.mediaListFragment)})
//            self.viewController.tableView.reloadData()
            complition()
        }
    }
    
    func nextPageFetch(type: SearchDetailType = .anime, seasonYear: Int, season: MediaSeason?, complition: @escaping ()->Void) {
        mediaSearchModel.nextPageFetch(type: type, seasonYear: seasonYear, season: season) { [weak self] pageData, pageInfo in
            guard let `self` = self else {return}
            guard let media = pageData.media else {return}
            self.totalMediaFragments += pageInfo.hasNextPage ? pageInfo.perPage : pageInfo.total
            self.mediaFragments += media.compactMap({MediaListViewFragment(fragment: $0?.fragments.mediaListFragment)})
//            self.viewController.tableView.reloadData()
            complition()
        }
    }
}
