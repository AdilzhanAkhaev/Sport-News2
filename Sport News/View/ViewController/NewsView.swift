//
//  NewsView.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/28/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
class NewsView: UIView {
    let image = UIImageView()
    let title = UILabel()
    let author = UILabel()
    let content = UILabel()
    
    let scrollView = UIScrollView()
    
    init(article: Article) {
        if let url = URL(string: article.urlToImage ?? ""){
            self.image.kf.setImage(with: url)
        }
        self.title.text = article.title
        self.author.text = article.author
        self.content.text = article.content
        
        super.init(frame: CGRect.zero)
        
        scrollView.addSubview(image)
        scrollView.addSubview(title)
        scrollView.addSubview(author)
        scrollView.addSubview(content)
        
        addSubview(scrollView)
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        image.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView)
            make.right.left.equalTo(self)
            make.height.equalTo(image.snp.width).multipliedBy(0.7)
        }
        
        
        title.snp.makeConstraints { (make) in
            make.top.equalTo(image.snp.bottom)
            make.right.left.equalTo(self).inset(20)
        }
        
        author.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).inset(-5)
            make.right.left.equalTo(self).inset(20)
        }
        
        content.snp.makeConstraints { (make) in
            make.top.equalTo(author.snp.bottom).inset(-10)
            make.right.left.equalTo(self).inset(20)
            make.bottom.equalTo(scrollView)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
