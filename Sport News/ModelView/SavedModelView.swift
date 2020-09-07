//
//  SavedModelView.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/29/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
import Moya
import RealmSwift
class SavedModelView: ViewModelProtocol {
    var didLoadMoreArticles = Observable<Bool>(false)
    var pageNumber = 1
    var articles = Observable<[Article]>([])
    var provider = MoyaProvider<ApiService>()
    let realm = try! Realm()
    var articleCount: Int{
        return articles.value.count
    }
    
    func getArtile(for indexPath: Int) -> Article {
        return articles.value[indexPath]
    }
    
    func fetchData() {
        articles.value = []
        let result = realm.objects(SaveNews.self)
        for aricle in result{
            if let saveArticle = aricle.article{
                self.articles.value.append(saveArticle)
            }
        }
    }
    func loadMoreData() {
        return
    }
}
