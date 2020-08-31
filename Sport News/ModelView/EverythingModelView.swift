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
    var pageNumber = 1
    func getArtile(for indexPath: Int) -> Article {
        return articles.value[indexPath]
    }
}
//MARK: - Network
extension EverythingModelView{
    func fetchData(){
        provider.request(.getEverything(pageNumber: pageNumber)) { result in
            switch result {
                case let .success(moyaResponse):
                    do {
                        let data = try moyaResponse.filterSuccessfulStatusCodes().data
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let news = try decoder.decode(News.self, from: data)
                        
                        self.articles.value = news.articles
//                        for article in news.articles{
//                            self.articles.value.append(article)
//                        }
                    }catch{
                        print("Error with decoding News: \(error)")
                    }
                case .failure(_): break
            }
        }
    }
}
