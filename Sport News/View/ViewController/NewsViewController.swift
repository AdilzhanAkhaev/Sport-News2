//
//  NewsViewController.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/28/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController{
    var viewModel = NewsViewModel()
    var newsView = NewsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveNews))
    }
    
    override func loadView() {
        self.view = newsView
    }

    @objc func saveNews() {
        let alert = UIAlertController(title: "Do you want to save the news?", message: "", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.viewModel.saveNews()
        }
        let notAction = UIAlertAction(title: "No", style: .default) { (action) in
            print("Click not save")
        }
        alert.addAction(yesAction)
        alert.addAction(notAction)
        present(alert,animated: true,completion: nil)
    }
    
    func set(article: Article) {
        viewModel.setArticle(article: article)
        newsView.set(article: article)
    }
}
