//
//  MediaDetailHeaderViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/12/01.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MediaDetailHeaderViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var formatLabel: UILabel!
    @IBOutlet weak var statusDistributionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var mediaDetailViewController : MediaDetailViewController! {
        return parent as? MediaDetailViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    override func didMove(toParent parent: UIViewController?) {
        guard let _ = parent else {return}
        guard let url = mediaDetailViewController.presenter.bannerImageURL else {return}
        imageView.load(url: url, complition: {
            self.imageView.setNeedsLayout()
        })
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
