//
//  NewsDetailsViewController.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//

import UIKit

class NewsDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: NewsCellViewModel?

    
//    convenience init(viewModel: NewsCellViewModel) {
//        self.init()
//        self.viewModel = viewModel
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "NewsDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsDetailTableViewCell")
        tableView.contentInsetAdjustmentBehavior = .never
    }
}

extension NewsDetailsViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsDetailTableViewCell", for: indexPath) as? NewsDetailTableViewCell
        cell?.model = viewModel
        cell?.webLinkClicked = { [weak self] (webUrl) in
            self?.showWebView(webUrl)
        }
        return cell ?? UITableViewCell()
    }
}

extension NewsDetailsViewController {
    func showWebView(_ url: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let webVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        webVC?.urlString = url
        if let thisVC = webVC {
            self.navigationController?.pushViewController(thisVC, animated: true)
        }
    }
}
