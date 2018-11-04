//
//  Utilites.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/01.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL, complition: @escaping ()->Void) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        complition()
                    }
                }
            }
        }
    }
}
