//
//  Article.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/26/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
struct Article: Codable{
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct Source: Codable{
    let id: String?
    let name: String?
}


