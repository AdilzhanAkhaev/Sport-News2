//
//  SavedTableViewController.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/27/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import RealmSwift
class SavedTableViewController: UITableViewController {
    var viewModel = SavedModelView()
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Saved"
        configureTableView()
        viewModel.fetchData()
        viewModel.articles.bind {_ in
            self.tableView.reloadData()
        }
        addRefreshControl()
    }
    
    func configureTableView() {
           tableView.delegate = self
           tableView.dataSource = self
           tableView.rowHeight = 100
           tableView.register(CustemTableViewCell.self, forCellReuseIdentifier: Key.cellIdentifier)
       }
    func addRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(self.refreshControl!)

    }
    
    @objc func refresh(_ sender: AnyObject){
        self.viewModel.fetchData()
        DispatchQueue.main.async {
            self.refreshControl!.endRefreshing()
        }
    }
       
    //MARK: - TableView DataSource and Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articleCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Key.cellIdentifier) as! CustemTableViewCell
        let article = viewModel.getArtile(for: indexPath.item)
        cell.set(article: article)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsViewController = NewsViewController()
        newsViewController.set(article: viewModel.getArtile(for: indexPath.item))
        navigationController?.pushViewController(newsViewController, animated: false)
    }
}
