//
//  FirstViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/10/21.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let mediaSearchModel = MediaSearchModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        mediaSearchModel.fetch(page: 1, seasonYear: 2018, season: .spring) { [weak self] page in
            guard let `self` = self else {return}
            self.tableView.reloadData()
//            self.titleLabel.text = first?.fragments.mediaDetail.title?.native
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

extension FirstViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaSearchModel.totalDisplayPage
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let currentPage = mediaSearchModel.pageDataSet.first?.pageInfo?.currentPage else {return UITableViewCell()}
        guard let media = mediaSearchModel.pageDataSet[currentPage - 1].media?[indexPath.row] else  {return UITableViewCell()}
        cell.textLabel?.text = media.fragments.mediaDetail.title?.native
        guard let urlString = media.fragments.mediaDetail.coverImage?.medium else {return cell}
        guard let url = URL(string: urlString) else {return cell}
        cell.imageView?.image = UIImage()
        cell.imageView?.load(url: url) {
            cell.setNeedsLayout()
        }
        return cell
    }
    
}

extension FirstViewController: UITableViewDelegate {
    
}
