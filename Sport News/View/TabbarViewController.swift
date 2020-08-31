//
//  TabbarViewController.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/27/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//

import UIKit

class TabbarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    func setupTabbar()  {
        let topHeadlinesController = UINavigationController(rootViewController: TopHeadliensTableViewController())
        topHeadlinesController.tabBarItem.image = UIImage(systemName: "star")
        topHeadlinesController.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        let everythingController = UINavigationController(rootViewController: EverythingTableViewController())
        everythingController.tabBarItem.image = UIImage(systemName: "asterisk.circle")
        everythingController.tabBarItem.selectedImage = UIImage(systemName: "asterisk.circle.fill")
        let savedController = UINavigationController(rootViewController: SavedTableViewController())
        savedController.tabBarItem.image = UIImage(systemName: "bookmark")
        savedController.tabBarItem.selectedImage = UIImage(systemName: "bookmark.fill")
        viewControllers = [topHeadlinesController,everythingController,savedController]
    }
}
