//
//  FirstViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/10/21.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    let mediaModel = MediaModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mediaModel.fetch(page: 1, seasonYear: 2018, season: .spring) { [weak self] mediaList in
            guard let `self` = self else {return}
            guard let first = mediaList?.media?.first else {return}
            self.titleLabel.text = first?.fragments.mediaDetail.title?.native
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

