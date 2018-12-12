//
//  MediaDetailViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/06.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MediaDetailViewController: UIViewController {
    
    typealias SectionType = MediaDetailTableViewSectionType
    
    private enum Const {
        static let headerViewHeight : CGFloat = 412
    }
    
    @IBOutlet weak var aiView: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: ScrollableUIControlTableView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet var headerViewContainer : ContainerView!
    
    var headerViewController : MediaDetailHeaderViewController! = MediaDetailHeaderViewController()

    lazy var presenter = MediaDetailPresenter(viewController: self)
    
    @IBAction func tappedLeftNavigationItem(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    init(mediaId: Int) {
        super.init(nibName: "\(MediaDetailViewController.self)", bundle: .main)
        self.presenter.mediaId = mediaId
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset.top = Const.headerViewHeight
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.delegate = self
        view.addGestureRecognizer(tableView.panGestureRecognizer)
        
        tableView.register(UINib(nibName: "\(MediaDetailStoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: MediaDetailStoryTableViewCell.identifier)
        tableView.register(UINib(nibName: "\(MediaDetailReviewTableViewCell.self)", bundle: nil), forCellReuseIdentifier: MediaDetailReviewTableViewCell.identifier)
        tableView.register(MediaDetailTableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: MediaDetailTableViewHeaderFooterView.identifier)
        tableView.dataSource = self
        tableView.isHidden = true
        
        addChild(headerViewController)
        headerViewContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Const.headerViewHeight)
        headerViewController.view.frame = headerViewContainer.frame
        headerViewContainer.addSubviewContainer(headerViewController.view)
        
        presenter.fetchAll(complition: {[weak self] in
            guard let `self` = self else {return}
            self.headerViewController.didMove(toParent: self)
            // navigation bar title
            self.navigationBar.topItem?.title = self.presenter.title

            // show table view
            self.aiView.stopAnimating()
            self.tableView.isHidden = false
            self.tableView.reloadData()
            
        })

        // Do any additional setup after loading the view.
    }

}

extension MediaDetailViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else {fatalError()}
        switch sectionType {
        case .story:
            return 1
        case .reviews:
            return presenter.media?.reviewsNodes?.count ?? 0
        default:
            // FIXME: need configure other cases
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = SectionType(rawValue: indexPath.section) else {fatalError()}
        switch sectionType {
        case .story:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MediaDetailStoryTableViewCell.identifier, for: indexPath) as? MediaDetailStoryTableViewCell else {return UITableViewCell()}
            cell.configure(text: presenter.media?.description)
            return cell
        case .reviews:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MediaDetailReviewTableViewCell.identifier, for: indexPath) as? MediaDetailReviewTableViewCell else {return UITableViewCell()}
            let review = presenter.media?.reviewsNodes?[indexPath.row]
            cell.configure(review?.user?.name ,text: review?.body)
            cell.delegate = self
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionType = SectionType(rawValue: section) else {fatalError()}
        return sectionType.sectionTitle
    }
    
}

extension MediaDetailViewController : UINavigationBarDelegate {
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}

extension MediaDetailViewController : MediaDetailReviewTableViewCellDelegate {
    func touchesBegan(cell: MediaDetailReviewTableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {return}
        guard let body = presenter.media?.reviewsNodes?[indexPath.row].body else {return}
        tableView.beginUpdates()
        cell.reloadTextView(body)
        tableView.endUpdates()
    }
}
