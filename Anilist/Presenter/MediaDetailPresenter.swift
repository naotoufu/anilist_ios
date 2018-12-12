//
//  MediaDetailPresenter.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/11.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
class MediaDetailPresenter: NSObject {
    var mediaId : Int?
    
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
    
    func fetchAll(with mediaId: Int? = nil, complition: @escaping ()->Void) {
        if let mediaId = mediaId { self.mediaId = mediaId }
        guard let mediaId = self.mediaId else {return}
        fetchMedia(with: mediaId) {
            complition()
        }
    }
    
    func fetchMedia(with id: Int!, complition: @escaping ()->Void) {
        mediaDetailModel.fetch(id: id) { [weak self] media in
            guard let `self` = self else {return}
            self.media = MediaDetailViewFragment(fragment: media)
            complition()
        }
    }
    
}
