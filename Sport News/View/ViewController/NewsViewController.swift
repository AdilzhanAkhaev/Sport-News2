//
//  NewsViewController.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/28/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import SnapKit
import RealmSwift
class NewsViewController: UIViewController{
    let image = UIImageView()
    let titleA = UILabel()
    let author = UILabel()
    let content = UILabel()
    var arcticleArray = [Article]()
    let scrollView = UIScrollView()
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(image)
        scrollView.addSubview(titleA)
        scrollView.addSubview(author)
        scrollView.addSubview(content)
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        addViewConstraints()
        configView()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveNews))
    }

    @objc func saveNews() {
        try! realm.write {
            let myReal = SaveNews()
            myReal.article = arcticleArray.first
            realm.add(myReal)
        }
    }
    
    func set(article: Article) {
        arcticleArray.append(article)
        if let url = URL(string: article.urlToImage ?? ""){
            self.image.kf.setImage(with: url)
        }
        self.titleA.text = article.title
        self.author.text = "Author: \(article.author ?? "Unknown")"
        self.content.text = article.content
    }
    
    func configView()  {
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        titleA.font = .systemFont(ofSize: 23)        
        titleA.numberOfLines = 0
        author.font = .systemFont(ofSize: 18)
        author.numberOfLines = 0
        content.font = .systemFont(ofSize: 16)
        content.numberOfLines = 0
    }
    
    func addViewConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        image.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView)
            make.right.left.equalTo(view)
            make.height.equalTo(image.snp.width).multipliedBy(0.7)
        }
        titleA.snp.makeConstraints { (make) in
            make.top.equalTo(image.snp.bottom)
            make.right.left.equalTo(view).inset(20)
        }
        author.snp.makeConstraints { (make) in
            make.top.equalTo(titleA.snp.bottom).inset(-5)
            make.right.left.equalTo(view).inset(20)
        }
        content.snp.makeConstraints { (make) in
            make.top.equalTo(author.snp.bottom).inset(-10)
            make.right.left.equalTo(view).inset(20)
            make.bottom.equalTo(scrollView)
        }
    }
}
