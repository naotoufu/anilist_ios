//
//  MediaTitle.swift
//  Anilist
//
//  Created by NaotoIto on 2018/10/27.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation

struct MediaTitle {
    
    // The romanization of the native language title
    //
    // Arguments
    // stylised: [Not documented]
    var romaji(stylised: Boolean): String
    
    // The official english title
    //
    // Arguments
    // stylised: [Not documented]
    var english(stylised: Boolean): String
    
    // Official title in it's native language
    //
    // Arguments
    // stylised: [Not documented]
    var native(stylised: Boolean): String
    
    // The currently authenticated users preferred title language. Default romaji for
    // non-authenticated
    var userPreferred: String
}
