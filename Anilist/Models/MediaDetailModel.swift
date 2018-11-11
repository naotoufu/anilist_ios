//
//  MediaDetailModel.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/11.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import Apollo

class MediaDetailModel: NSObject {
    let apollo = ApolloClient(url: URL(string: "https://graphql.anilist.co")!)
    
    func fetch(id: Int, complition: @escaping (MediaDetailFragment)->Void) {
        apollo.fetch(query: MediaDetailQuery(id: id)) { (result, error) in
            if let _ = error {return}
            guard let data = result?.data?.media?.fragments.mediaDetailFragment else {return}
            complition(data)
        }
    }
}
