//
//  SearchDetailNavigationItemViewControllerProtocol.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/24.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import UIKit

protocol SearchDetailNavigationItemViewControllerProtocol where Self : UIViewController {
    var searchDetailViewController : SearchDetailViewController! {get}
    var scpresenter : SearchConditionPresenter! {get}
    
}

extension SearchDetailNavigationItemViewControllerProtocol {
    var searchDetailViewController : SearchDetailViewController! {
        return self.navigationController?.viewControllers.first as? SearchDetailViewController
    }
    var scpresenter : SearchConditionPresenter! {
        return searchDetailViewController.scpresenter
    }
}
