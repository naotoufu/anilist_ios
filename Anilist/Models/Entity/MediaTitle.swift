//
//  MediaTitle.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/05.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
struct MediaTitle {
    // The romanization of the native language title
    //
    // Arguments
    // stylised: [Not documented]
    var romaji: String
    // The official english title
    //
    // Arguments
    // stylised: [Not documented]
    var english: String
    // Official title in it's native language
    //
    // Arguments
    // stylised: [Not documented]
    var native: String
    // The currently authenticated users preferred title language. Default romaji for
    // non-authenticated
    var userPreferred: String
    
    init(title :MediaListFragment.Title?) {
        self.romaji = title?.romaji ?? ""
        self.native = title?.native ?? ""
        self.english = title?.english ?? ""
        self.userPreferred = title?.userPreferred ?? ""
    }
    
    init(title :MediaDetailFragment.Title?) {
        self.romaji = title?.romaji ?? ""
        self.native = title?.native ?? ""
        self.english = title?.english ?? ""
        self.userPreferred = title?.userPreferred ?? ""
    }
}
