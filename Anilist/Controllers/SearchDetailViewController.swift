//
//  SearchDetailViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/20.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class SearchDetailViewController: UIViewController,SearchSelectViewControllerProtocol {
    
    typealias RowType = SearchDetailTableRowType
    
    var bottomVC : SearchBottomToolViewController! = SearchBottomToolViewController()
    
    weak var scpresenter : SearchConditionPresenter!

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomContainer: UIView!
    @IBAction func tappedRightBarButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tableView.register(UINib(nibName: "\(RightDetailStyleTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(RightDetailStyleTableViewCell.self)")
        tableView.register(UINib(nibName: "\(SearchDetailYearTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "\(SearchDetailYearTableViewCell.self)")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tableView.separatorColor = tableView.backgroundColor
        
        addChild(bottomVC)
        bottomVC.view.frame = bottomContainer.frame
        view.bringSubviewToFront(bottomContainer)
        bottomContainer.addSubview(bottomVC.view)
        bottomVC.doneButton.isHidden = true // done button hide
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

    init(scpresenter :SearchConditionPresenter!) {
        super.init(nibName: "\(SearchDetailViewController.self)", bundle: nil)
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

extension SearchDetailViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RowType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = RowType(rawValue: indexPath.row) else { fatalError() }

        switch sectionType {
        case .year:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(SearchDetailYearTableViewCell.self)", for: indexPath) as! SearchDetailYearTableViewCell
            cell.selectionStyle = .none
            cell.titleLabel.text = sectionType.string
            return cell
        case .type:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(RightDetailStyleTableViewCell.self)", for: indexPath) as! RightDetailStyleTableViewCell
            cell.detailTextLabel?.text = scpresenter.type.string
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = sectionType.string
            return cell
        case .season:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(RightDetailStyleTableViewCell.self)", for: indexPath) as! RightDetailStyleTableViewCell
            cell.detailTextLabel?.text = scpresenter.season?.rawValue ?? "No Select"
            cell.selectionStyle = .none
            cell.accessoryType = .disclosureIndicator
            cell.textLabel?.text = sectionType.string
            return cell
        case .filter: break
        case .advance: break
        }
        return UITableViewCell()
    }
    
}

extension SearchDetailViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let rowType = RowType(rawValue: indexPath.row) else { return }
        switch rowType {
        case .type:
            navigationController?.pushViewController(SearchSelectTypeViewController(scpresenter: scpresenter), animated: true)
        case .season:
            navigationController?.pushViewController(SearchSelectSeasonViewController(scpresenter: scpresenter), animated: true)
        case .year: break
        case .filter : break // FIXME: - need impliment
        case .advance : break // FIXME: - need impliment
        }
        
    }
}
