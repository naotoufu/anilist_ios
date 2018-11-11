//
//  MediaDetailFragment.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/11.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation

struct MediaDetailViewFragment {
    var id: Int
    var title : MediaTitle
    var coverImage : MediaCoverImage
    var bannerImage : String
    
    init(fragment: MediaDetailFragment?) {
        self.id = fragment?.id ?? Int.max
        self.title = MediaTitle(title: fragment?.title)
        self.coverImage = MediaCoverImage(coverImage: fragment?.coverImage)
        self.bannerImage = fragment?.bannerImage ?? ""
    }
}
