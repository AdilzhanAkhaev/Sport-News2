//
//  NewsViewModel.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 9/1/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit
import RealmSwift

class NewsViewModel {
    var arcticleArray = [Article]()
    let realm = try! Realm()
    func setArticle(article: Article) {
        arcticleArray.append(article)
    }
    func saveNews() {
        var duplicate: [String] = []
        let result = realm.objects(SaveNews.self)
        for saveArticle in result {
            duplicate.append((saveArticle.article?.content ?? ""))
        }
        if !duplicate.contains((arcticleArray.first?.content)!){
            try! realm.write {
                let myReal = SaveNews()
                myReal.article = arcticleArray.first
                realm.add(myReal)
            }
        }else{
            print("we have already saved")
        }
    }
}
