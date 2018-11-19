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

extension UIFont {
    func drawImagesAndText() -> UIImage {
        // 1
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))
        
        let img = renderer.image { ctx in
            // 2
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            
            // 3
            let attrs = [NSAttributedString.Key.font: UIFont(name: "Linearicons-Free", size: 36)!, NSAttributedString.Key.paragraphStyle: paragraphStyle]
            
            // 4
            let string = "The best-laid schemes o'\nmice an' men gang aft agley"
            string.draw(with: CGRect(x: 32, y: 32, width: 448, height: 448), options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
            
            // 5
            let mouse = UIImage(named: "mouse")
            mouse?.draw(at: CGPoint(x: 300, y: 150))
        }
        
        // 6
        return img
    }
}
