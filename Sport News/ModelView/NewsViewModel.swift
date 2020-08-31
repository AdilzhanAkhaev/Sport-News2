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
        try! realm.write {
            let myReal = SaveNews()
            myReal.article = arcticleArray.first
            realm.add(myReal)
        }
    }
}
