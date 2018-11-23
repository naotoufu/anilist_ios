//
//  SearchConditionPresenter.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/23.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation

class SearchConditionPresenter: NSObject {
    
    let date = Date()
    
    var type : SearchDetailType!
    var year : Int!
    var season : MediaSeason?
//    var filter :
//    var advance :
    
    init(type : SearchDetailType!, year : Int?, season : MediaSeason?) {
        super.init()
        self.type = type
        self.year = year ?? Calendar.current.component(.year, from: date)
        self.season = season
    }
}
