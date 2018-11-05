//
//  MediaFormat.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/05.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
enum MediaFormat {
    // Anime broadcast on television
    case tv
    // Anime which are under 15 minutes in length and broadcast on television
    case tv_short
    // Anime movies with a theatrical release
    case movie
    // Special episodes that have been included in DVD/Blu-ray releases, picture
    // dramas, pilots, etc
    case special
    // (Original Video Animation) Anime that have been released directly on DVD/Blu-ray
    // without originally going through a theatrical release or television broadcast
    case ova
    // (Original Net Animation) Anime that have been originally released online or are
    // only available through streaming services.
    case ona
    // Short anime released as a music video
    case music
    // Professionally published manga with more than one chapter
    case manga
    // Written books released as a novel or series of light novels
    case novel
    // Manga with just one chapter
    case one_shot

}
