//
//  NewsView.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 9/6/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import SnapKit
class NewsView: UIView {
    private let image = UIImageView()
    private let titleA = UILabel()
    private let author = UILabel()
    private let content = UILabel()
    private let scrollView = UIScrollView()
    
    private func addView() {
        scrollView.addSubview(image)
        scrollView.addSubview(titleA)
        scrollView.addSubview(author)
        scrollView.addSubview(content)
        scrollView.backgroundColor = .white
        addSubview(scrollView)
        addViewConstraints(in: self)
        configView()
    }
    
    private func configView()  {
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        titleA.font = .boldSystemFont(ofSize: 23)
        titleA.numberOfLines = 0
        author.font = UIFont(name: "AppleSDGothicNeo-Thin", size: 16)
        author.numberOfLines = 0
        content.font = .systemFont(ofSize: 18)
        content.numberOfLines = 0
    }
    
    private func addViewConstraints(in view: UIView) {
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        image.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView)
            make.right.left.equalTo(view)
            make.height.equalTo(image.snp.width).multipliedBy(0.7)
        }
        titleA.snp.makeConstraints { (make) in
            make.top.equalTo(image.snp.bottom).inset(-40)
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
    
    func set(article: Article) {
        if let url = URL(string: article.urlToImage ?? ""){
            self.image.kf.setImage(with: url)
        }
        self.titleA.text = article.title
        self.author.text = "Author: \(article.author ?? "Unknown")"
        self.content.text = article.content
    }

    init() {
        super.init(frame: .zero)
        addView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
