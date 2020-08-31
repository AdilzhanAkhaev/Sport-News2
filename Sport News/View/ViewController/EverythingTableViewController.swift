//
//  EverythingTableViewController.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/27/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit

class EverythingTableViewController: UITableViewController {
    var viewModel = EverythingModelView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Everything"
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
    
    @objc func refresh(_ sender: AnyObject) {
        self.viewModel.pageNumber = 1
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
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.articleCount - 1{
//            viewModel.pageNumber = viewModel.pageNumber + 1
            viewModel.fetchData()
        }
    }
}
