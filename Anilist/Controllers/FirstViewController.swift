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
    
    lazy var presenter : FirstPresenter = FirstPresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UINib(nibName: "\(LoadingFooterView.self)", bundle: nil), forHeaderFooterViewReuseIdentifier: LoadingFooterView.identifier)
        tableView.tableFooterView = UINib(nibName: "\(LoadingFooterView.self)", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! LoadingFooterView
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.fetch(seasonYear: 2018, season: .spring) { [weak self] in
            self?.tableView.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

extension FirstViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.totalMediaDetails
    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 44
//    }
//
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        return tableView.dequeueReusableHeaderFooterView(withIdentifier: LoadingFooterView.identifier)
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard presenter.mediaDetails.count > 0 else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let mediaDetail = presenter.mediaDetails[indexPath.row]
        cell.textLabel?.text = mediaDetail.title?.native
        guard let urlString = mediaDetail.coverImage?.medium else {return cell}
        guard let url = URL(string: urlString) else {return cell}
        cell.imageView?.image = UIImage()
        cell.imageView?.load(url: url) {
            cell.setNeedsLayout()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if presenter.hasNextPage && indexPath.row == presenter.totalMediaDetails - 1 {
            presenter.nextPageFetch(seasonYear: 2018, season: .spring) {[weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension FirstViewController: UITableViewDelegate {
    
}
