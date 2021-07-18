//
//  NewsListViewController.swift
//  DRC_Test
//
//  Created by Nihal Khokhari on 18/07/21.
//


// f1fdde20c9d74859804996f62a8e3d16
import UIKit

class NewsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var viewModel = NewsListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        
        if NewsAPIClass.isConnected() {
            viewModel.getNewsData { [weak self] success in
                if success {
                    self?.tableView.reloadData()
                } else {
                    print("failed to load data")
                }
            }
        } else {
            viewModel.getNewsFromDB()
            tableView.reloadData()
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        tableView.contentInsetAdjustmentBehavior = .never
    }
}


extension NewsListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell
        cell?.model = viewModel.items[indexPath.row]
        return cell ?? UITableViewCell()
    }
}

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newsDetailVC = storyboard.instantiateViewController(withIdentifier: "NewsDetailsViewController") as? NewsDetailsViewController
        newsDetailVC?.viewModel = viewModel.items[indexPath.row]
        if let thisVC = newsDetailVC {
            self.navigationController?.pushViewController(thisVC, animated: true)
        }
    }
}

 
