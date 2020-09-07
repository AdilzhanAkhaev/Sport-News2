//
//  EverythingModelView.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/27/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
import Moya
class EverythingModelView: ViewModelProtocol{
    var articles = Observable<[Article]>([])
    var provider = MoyaProvider<ApiService>()
    var articleCount: Int {
        return articles.value.count
    }
    var pageNumber = 0
    func getArtile(for indexPath: Int) -> Article {
        return articles.value[indexPath]
    }
    var didUpdateArticles = Observable<Bool>(false)
    var didLoadMoreArticles = Observable<Bool>(false)
}
//MARK: - Network
extension EverythingModelView{
    func fetchData(){
        self.didUpdateArticles.value = false
        pageNumber = 1
        provider.request(.getEverything(pageNumber: pageNumber)) { result in
            switch result {
                case let .success(moyaResponse):
                    do {
                        let data = try moyaResponse.filterSuccessfulStatusCodes().data
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let news = try decoder.decode(News.self, from: data)
                        self.articles.value = news.articles
                    }catch{
                        print("Error with decoding News: \(error)")
                    }
                self.didUpdateArticles.value = true
                case .failure(_): break
            }
        }
    }
    
    func loadMoreData() {
        self.didLoadMoreArticles.value = false
        provider.request(.getEverything(pageNumber: pageNumber)) { result in
            switch result {
                case let .success(moyaResponse):
                    do {
                        let data = try moyaResponse.filterSuccessfulStatusCodes().data
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let news = try decoder.decode(News.self, from: data)
                        for article in news.articles{
                            self.articles.value.append(article)
                        }
                    }catch{
                        print("Error with decoding News: \(error)")
                    }
                    self.didLoadMoreArticles.value = true
                case .failure(_): break
            }
        }
    }
}
