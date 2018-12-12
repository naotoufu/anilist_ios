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
    var format : MediaFormat
    var coverImage : MediaCoverImage
    var bannerImage : String
    var description : String
    var staff : MediaDetailFragment.Staff
    var relations : MediaDetailFragment.Relation
    var source : MediaSource
    var hashtag : String
    var averageScore : Int
    var meanScore : Int
    var popularity : Int
    var trending : Int
    var siteUrl : String
    var reviews : MediaDetailFragment.Review
    
    init(fragment: MediaDetailFragment?) {
        self.id = fragment?.id ?? Int.max
        self.title = MediaTitle(title: fragment?.title)
        self.format = fragment?.format ?? MediaFormat.__unknown("default")
        self.coverImage = MediaCoverImage(coverImage: fragment?.coverImage)
        self.bannerImage = fragment?.bannerImage ?? ""
        self.description = fragment?.description ?? ""
        self.staff = fragment?.staff ?? MediaDetailFragment.Staff()
        self.relations = fragment?.relations ?? MediaDetailFragment.Relation()
        self.source = fragment?.source ?? MediaSource.__unknown("default")
        self.hashtag = fragment?.hashtag ?? ""
        self.averageScore = fragment?.averageScore ?? 0
        self.meanScore = fragment?.meanScore ?? 0
        self.popularity = fragment?.popularity ?? 0
        self.trending = fragment?.trending ?? 0
        self.siteUrl = fragment?.siteUrl ?? ""
        self.reviews = fragment?.reviews ?? MediaDetailFragment.Review()
    }
    
    var reviewsNodes : [MediaDetailFragment.Review.Edge.Node]? {
        return self.reviews.edges?.compactMap({$0?.node})
    }
    
//    var staffIds : [Int]? {
//        return self.staff.edges?.compactMap({$0.unsafelyUnwrapped.node?.id})
//    }
//
//    var relationIds : [Int]? {
//        return self.relations.edges?.compactMap({$0.unsafelyUnwrapped.node?.id})
//    }
//
//    var reviewsIds : [Int]? {
//        return self.reviews.edges?.compactMap({$0.unsafelyUnwrapped.node?.id})
//    }
}
