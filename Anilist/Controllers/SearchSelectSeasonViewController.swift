//
//  SearchSelectSeasonViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/23.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class SearchSelectSeasonViewController: UIViewController, SearchSelectViewControllerProtocol {
    let tableVC = SearchSelectSeasonTableViewController()
    var bottomVC : SearchBottomToolViewController! = SearchBottomToolViewController()
    weak var scpresenter: SearchConditionPresenter!

    @IBOutlet weak var bottomContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(tableVC)
        tableVC.view.frame = view.frame
        view.addSubview(tableVC.view)
        tableVC.didMove(toParent: self)
        
        addChild(bottomVC)
        bottomVC.view.frame = bottomContainer.frame
        view.bringSubviewToFront(bottomContainer)
        bottomContainer.addSubview(bottomVC.view)
        bottomVC.didMove(toParent: self)
        // Do any additional setup after loading the view.
    }
    
    override func updateViewConstraints() {
        bottomVC.view.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.topAnchor.constraint(equalTo: bottomVC.view.topAnchor).isActive = true
        bottomContainer.bottomAnchor.constraint(equalTo: bottomVC.view.bottomAnchor).isActive = true
        bottomContainer.leadingAnchor.constraint(equalTo: bottomVC.view.leadingAnchor).isActive = true
        bottomContainer.trailingAnchor.constraint(equalTo: bottomVC.view.trailingAnchor).isActive = true
        super.updateViewConstraints()
    }
    
    init(scpresenter: SearchConditionPresenter) {
        super.init(nibName: "\(SearchSelectSeasonViewController.self)", bundle: nil)
        self.scpresenter = scpresenter
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
