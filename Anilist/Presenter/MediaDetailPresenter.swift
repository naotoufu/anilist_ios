//
//  MediaDetailPresenter.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/11.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
class MediaDetailPresenter: NSObject {
    var id : Int?
    
    fileprivate weak var viewController : MediaDetailViewController!
    
    init(viewController: MediaDetailViewController){
        self.viewController = viewController
    }
    
    let mediaDetailModel = MediaDetailModel()
    
    var media : MediaDetailViewFragment?
    
    var bannerImageURL : URL? {
        guard let str = self.media?.bannerImage else {return nil}
        return URL(string: str)
    }
    
    var title : String {
        return media?.title.native ?? ""
    }
    
    func fetch(id: Int? = nil, complition: @escaping ()->Void) {
        if let id = id { self.id = id }
        guard let mediaId = self.id else {return}
        mediaDetailModel.fetch(id: mediaId) { [weak self] media in
            guard let `self` = self else {return}
            self.media = MediaDetailViewFragment(fragment: media)
            complition()
        }
    }
    
}
