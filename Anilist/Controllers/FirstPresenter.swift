//
//  FirstPresenter.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/05.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
class FirstPresenter: NSObject {
    fileprivate weak var viewController : FirstViewController!
    
    init(viewController: FirstViewController){
        self.viewController = viewController
    }
    
    let mediaSearchModel = MediaSearchModel()
    
    var mediaDetails : [MediaDetail] = [MediaDetail]()
    
    var totalMediaDetails = 0
    
    var hasNextPage : Bool = false
    
    func fetch(seasonYear: Int, season: MediaSeason?, complition: @escaping ()->Void) {
        mediaSearchModel.fetch(seasonYear: seasonYear, season: season) { [weak self] pageData, pageInfo in
            guard let `self` = self else {return}
            guard let media = pageData.media else {return}
            self.hasNextPage = pageInfo.hasNextPage
            self.totalMediaDetails += pageInfo.hasNextPage ? pageInfo.perPage : pageInfo.total
            self.mediaDetails += media.compactMap({$0?.fragments.mediaDetail})
//            self.viewController.tableView.reloadData()
            complition()
        }
    }
    
    func nextPageFetch(seasonYear: Int, season: MediaSeason?, complition: @escaping ()->Void) {
        mediaSearchModel.nextPageFetch(seasonYear: seasonYear, season: season) { [weak self] pageData, pageInfo in
            guard let `self` = self else {return}
            guard let media = pageData.media else {return}
            self.totalMediaDetails += pageInfo.hasNextPage ? pageInfo.perPage : pageInfo.total
            self.mediaDetails += media.compactMap({$0?.fragments.mediaDetail})
//            self.viewController.tableView.reloadData()
            complition()
        }
    }
}
