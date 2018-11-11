//
//  FirstViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/10/21.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MediaListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    lazy var presenter : MediaListPresenter = MediaListPresenter(viewController: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UINib(nibName: "\(LoadingFooterView.self)", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! LoadingFooterView
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.fetch(seasonYear: 2018, season: .spring) { [weak self] in
            self?.tableView.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}

extension MediaListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.totalMediaFragments
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard presenter.mediaFragments.count > 0 else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let mediaFragmemnt = presenter.mediaFragments[indexPath.row]
        cell.textLabel?.text = mediaFragmemnt.title.native
        let urlString = mediaFragmemnt.coverImage.medium
        guard let url = URL(string: urlString) else {return cell}
        // place holder
        cell.imageView?.image = UIImage(color: .white,size: CGSize(width: cell.frame.size.height, height: cell.frame.size.height))
        // image load async
        cell.imageView?.load(url: url) {
            cell.setNeedsLayout()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if presenter.hasNextPage && indexPath.row == presenter.totalMediaFragments - 1 {
            presenter.nextPageFetch(seasonYear: 2018, season: .spring) {[weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
}

extension MediaListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard presenter.mediaFragments.count > 0 else {return}
        let mediaFragment = presenter.mediaFragments[indexPath.row]
        let vc = MediaDetailViewController.instance(id: mediaFragment.id)
        self.present(vc, animated: true, completion: nil)
    }
}
