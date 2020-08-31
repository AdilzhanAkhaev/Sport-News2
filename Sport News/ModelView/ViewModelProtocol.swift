//
//  ViewModelProtocol.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/29/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
import Moya
protocol ViewModelProtocol {
    var articles : Observable<[Article]> { get set }
    var provider : MoyaProvider<ApiService> { get }
    var articleCount: Int { get }
    var pageNumber : Int { get set }
    func getArtile(for indexPath: Int) -> Article
    func fetchData()
    func loadMoreData()
}
