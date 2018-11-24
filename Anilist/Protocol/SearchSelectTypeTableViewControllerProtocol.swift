//
//  SearchSelectTypeTableViewControllerProtocol.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/24.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import Foundation
import UIKit

protocol SearchSelectTableViewControllerProtocol where Self : UITableViewController {
    associatedtype AssociatedType : SearchSelectViewControllerProtocol
    var searchSelectViewController : AssociatedType! {get}
    var scpresenter : SearchConditionPresenter! {get}
}

extension SearchSelectTableViewControllerProtocol {
    var searchSelectViewController : AssociatedType! {
        return self.parent as? AssociatedType
    }
    
    var scpresenter : SearchConditionPresenter! {
        return searchSelectViewController.scpresenter
    }
}
