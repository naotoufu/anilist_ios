//
//  SearchBottomToolViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/23.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class SearchBottomToolViewController: UIViewController,SearchDetailNavigationItemViewControllerProtocol {

    @IBOutlet weak var doneButton: SearchDoneButton!
    @IBOutlet weak var searchButton: SearchDecisionButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.delegate = self
        searchButton.delegate = self
        // Do any additional setup after loading the view.
    }
    
    init() {
        super.init(nibName: "\(SearchBottomToolViewController.self)", bundle: nil)
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

extension SearchBottomToolViewController : SearchDecisionButtonDelegate {
    func didDecised(_ button: UIButton) {
        if let mlVC = searchDetailViewController.presentingViewController?.children.first as? MediaListViewController {
            // FIXME: tableview clear. reprecent place holder
            mlVC.presenter.totalMediaFragments = 0
            mlVC.tableView.reloadData()
            
            // fetch data
            mlVC.presenter.fetch(type: scpresenter.type,seasonYear: scpresenter.year, season: scpresenter.season) {
                mlVC.tableView.reloadData()
            }
        }
        dismiss(animated: true, completion: nil)
    }
}

extension SearchBottomToolViewController : SearchDoneButtonDelegate {
    func didDone(_ button: UIButton) {

        if let indexPath = searchDetailViewController.tableView.indexPathForSelectedRow {
            // reload search condition text on detail label
            searchDetailViewController.tableView.reloadRows(at: [indexPath], with: .fade)
        }
        navigationController?.popViewController(animated: true)
    }
}
