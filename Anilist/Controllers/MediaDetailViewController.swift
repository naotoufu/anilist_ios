//
//  MediaDetailViewController.swift
//  Anilist
//
//  Created by NaotoIto on 2018/11/06.
//  Copyright © 2018 NaotoIto. All rights reserved.
//

import UIKit

class MediaDetailViewController: UIViewController {
    @IBOutlet weak var aiView: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    lazy var presenter = MediaDetailPresenter(viewController: self)
    
    @IBAction func tappedLeftNavigationItem(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    init(id: Int) {
        super.init(nibName: "\(MediaDetailViewController.self)", bundle: .main)
        self.presenter.id = id
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "\(MediaDetailStoryTableViewCell.self)", bundle: nil), forCellReuseIdentifier: MediaDetailStoryTableViewCell.identifier)
        tableView.dataSource = self
        
        tableView.isHidden = true
        
        presenter.fetch(complition: {[weak self] in
            guard let `self` = self else {return}
            // navigation bar title
            self.navigationBar.topItem?.title = self.presenter.title

            // show table view
            self.aiView.stopAnimating()
            self.tableView.isHidden = false
            self.tableView.reloadData()
            
            // table header
            let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.width, height: 200)))
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            guard let url = self.presenter.bannerImageURL else {return}
            imageView.load(url: url, complition: {
                self.tableView.tableHeaderView = imageView
            })
        })

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

extension MediaDetailViewController : UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MediaDetailStoryTableViewCell.identifier, for: indexPath) as? MediaDetailStoryTableViewCell else {return UITableViewCell()}
        cell.configure(text: presenter.media?.description)
        return cell
    }
    
}
