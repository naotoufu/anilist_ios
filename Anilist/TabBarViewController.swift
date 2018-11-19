//
//  TabBarController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/19.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        var items = [UITabBarItem]()
        items.append(UITabBarItem(title: "SEARCH", image: IconFont.image(fromIcon: .search, size: 22, color: UIColor.black), selectedImage: nil))
        items.append(UITabBarItem(title: "LIST", image: IconFont.image(fromIcon: .list, size: 22, color: UIColor.black), selectedImage: nil))
//        self.tabBar.setItems(items, animated: true)
        for (i, vc) in self.viewControllers!.enumerated() {
            vc.tabBarItem = items[i]
        }
    }
}
