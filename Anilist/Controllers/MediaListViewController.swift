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
    
    lazy var refreser: UIRefreshControl = {
        let ref = UIRefreshControl()
        ref.attributedTitle = NSAttributedString(string: "Pull to refresh")
        ref.tintColor = .gray
        ref.addTarget(self, action: #selector(self.reloadTableView), for: .valueChanged)
        return ref
    }()
    
    @objc func reloadTableView() {
        self.tableView.reloadData()
        refreser.endRefreshing()
    }
    
    lazy var presenter : MediaListPresenter = MediaListPresenter(viewController: self)
    let scpresenter = SearchConditionPresenter(type: .anime, year: nil, season: nil)
    
    @IBAction func tappedFilterButton(_ sender: UIButton) {
        let vc = SearchDetailViewController(scpresenter: scpresenter)
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.addSubview(refreser)
        
        tableView.register(UINib(nibName: "\(MediaListTableViewCell.self)", bundle: nil), forCellReuseIdentifier: MediaListTableViewCell.identifier)
        tableView.tableFooterView = UINib(nibName: "\(LoadingFooterView.self)", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! LoadingFooterView
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter.fetch(seasonYear: scpresenter.year, season: scpresenter.season) { [weak self] in
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MediaListTableViewCell.identifier, for: indexPath) as? MediaListTableViewCell else {return UITableViewCell()}
        let mediaFragmemnt = presenter.mediaFragments[indexPath.row]
        let urlString = mediaFragmemnt.coverImage.medium
        guard let url = URL(string: urlString) else {return cell}
        cell.configure(title: mediaFragmemnt.title.native, text: mediaFragmemnt.description, url: url, complition: { [weak cell] in
            cell?.setNeedsLayout()
        })
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
        let vc = MediaDetailViewController(mediaId: mediaFragment.id)
        self.present(vc, animated: true, completion: nil)
    }
}
