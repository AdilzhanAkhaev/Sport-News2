//
//  ViewController.swift
//  Sport News
//
//  Created by Adilzhan Akhayev on 8/26/20.
//  Copyright © 2020 Adilzhan. All rights reserved.
//
import Moya
import UIKit
class ViewController: UIViewController {
    let provider = MoyaProvider<ApiService>()

    override func viewDidLoad() {
        view.backgroundColor = .blue
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

