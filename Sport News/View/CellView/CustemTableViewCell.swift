//
//  CustemTableViewCell.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/27/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import Kingfisher
class CustemTableViewCell: UITableViewCell {
    var newsImageView = UIImageView()
    var newsTitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(newsImageView)
        addSubview(newsTitleLabel)
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented)")
    }
    
    func set(article: Article){
        if let url = URL(string: article.urlToImage ?? ""){
            newsImageView.kf.setImage(with: url)
        }
        newsTitleLabel.text = article.title
    }
    
    func configureImageView() {
        newsImageView.layer.cornerRadius = 10
        newsImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        newsTitleLabel.numberOfLines = 0
        newsTitleLabel.adjustsFontSizeToFitWidth = true
    }
    func setImageConstraints() {
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        newsImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        newsImageView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 12).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleLabelConstraints() {
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        newsTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        newsTitleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor,constant: 20).isActive = true
        newsTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
