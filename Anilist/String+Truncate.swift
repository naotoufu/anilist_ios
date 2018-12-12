//
//  String+Truncate.swift
//  Anilist
//
//  Created by NaotoIto on 2018/12/03.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
extension String {
    /*
     Truncates the string to the specified length number of characters and appends an optional trailing string if longer.
     - Parameter length: Desired maximum lengths of a string
     - Parameter trailing: A 'String' that will be appended after the truncation.
     
     - Returns: 'String' object.
     */
    func trunc(length: Int, trailing: String = "…") -> String {
        return (self.count > length) ? self.prefix(length) + trailing : self
    }
}

// Swift 4.0 Example
// let str = "I might be just a little bit too long".truncate(10) // "I might be…"
