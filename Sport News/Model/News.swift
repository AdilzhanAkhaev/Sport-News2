//
//  News.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/26/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
struct News: Codable{
    let status: String
    let totalResults: Int
    let articles: [Article]
}
