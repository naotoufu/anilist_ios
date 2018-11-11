//
//  MediaCoverImage.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/05.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
struct MediaCoverImage {
    var extraLarge: String
    // The cover image of media at its largest size
    var large: String
    // The cover image of media at medium size
    var medium: String
    
    init(coverImage: MediaListFragment.CoverImage?) {
        self.extraLarge = coverImage?.extraLarge ?? ""
        self.large = coverImage?.large ?? ""
        self.medium = coverImage?.medium ?? ""
    }
    
    init(coverImage: MediaDetailFragment.CoverImage?) {
        self.extraLarge = coverImage?.extraLarge ?? ""
        self.large = coverImage?.large ?? ""
        self.medium = coverImage?.medium ?? ""
    }
}
