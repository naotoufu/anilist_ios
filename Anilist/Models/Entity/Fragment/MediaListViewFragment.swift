//
//  MediaListViewFragment.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/05.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation

struct MediaListViewFragment {
    var id: Int
    var title : MediaTitle
    var coverImage : MediaCoverImage
    var bannerImage : String
    var description : String
    
    init(fragment: MediaListFragment?) {
        self.id = fragment?.id ?? Int.max
        self.title = MediaTitle(title: fragment?.title)
        self.coverImage = MediaCoverImage(coverImage: fragment?.coverImage)
        self.bannerImage = fragment?.bannerImage ?? ""
        self.description = fragment?.description ?? ""
    }
}
