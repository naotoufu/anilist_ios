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
    
    let queue = DispatchQueue(label: "first view")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        mediaSearchModel.fetch(page: 1, seasonYear: 2018, season: .spring) { [weak self] mediaList in
            guard let `self` = self else {return}
            guard let first = mediaList?.media?.first else {return}
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
        guard let count = mediaSearchModel.medias.first??.pageInfo?.perPage else {return 0}
        return count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        guard let currentPage = mediaSearchModel.medias.first??.pageInfo?.currentPage else {return UITableViewCell()}
        guard let media = mediaSearchModel.medias[currentPage - 1]?.media?[indexPath.row] else  {return UITableViewCell()}
        cell.textLabel?.text = media.fragments.mediaDetail.title?.native
        guard let urlString = media.fragments.mediaDetail.coverImage?.medium else {return cell}
        guard let url = URL(string: urlString) else {return cell}
        
        queue.async { [weak cell] in
            guard let cell = cell else {return}
            let imageData = try? Data(contentsOf: url)
            guard let data = imageData else {return }
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                cell.imageView?.image = image
            }

        }
        return cell
    }
    
}

extension FirstViewController: UITableViewDelegate {
    
}
