//
//  SaveNews.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/28/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import Foundation
import RealmSwift
class SaveNews: Object{
    @objc private dynamic var structData:Data? = nil
    var article : Article? {
        get {
            if let data = structData {
                return try? JSONDecoder().decode(Article.self, from: data)
            }
            return nil
        }
        set {
            structData = try? JSONEncoder().encode(newValue)
        }
    }
}

