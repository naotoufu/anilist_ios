//
//  MediaDetailViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/06.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MediaDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    lazy var presenter = MediaDetailPresenter(viewController: self)
    
    @IBAction func tappedLeftNavigationItem(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.fetch(complition: {[weak self] in
            guard let `self` = self else {return}
            // navigation bar title
            self.navigationBar.topItem?.title = self.presenter.title
            
            // table header
            let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 300)))
            guard let url = self.presenter.bannerImageURL else {return}
            imageView.load(url: url, complition: {
                self.tableView.tableHeaderView = imageView
            })
        })
    }

    class func instance(id: Int) -> MediaDetailViewController{
        let vc = UINib(nibName: "\(MediaDetailViewController.self)", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! MediaDetailViewController
        vc.presenter.id = id
        return vc
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
