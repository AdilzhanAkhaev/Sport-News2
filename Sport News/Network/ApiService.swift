//
//  ApiService.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/26/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation

import Moya
import UIKit
enum ApiService {
    case getTopHeadliens(pageNumber: Int)
    case getEverything(pageNumber: Int)
}

extension ApiService: TargetType{
    var baseURL: URL {
        return URL(string: "https://newsapi.org")!
    }
    
    var path: String {
        switch self {
        case .getTopHeadliens( _):
            return "/v2/top-headlines"
        case .getEverything( _):
            return "/v2/everything"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTopHeadliens,.getEverything:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getTopHeadliens(pageNumber: let pageNumber),.getEverything(pageNumber: let pageNumber):
            return .requestParameters(parameters: ["q": Key.categoryNews,"apiKey":Key.apiKey,"pageSize":Key.pageSize,"page":pageNumber], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
}

