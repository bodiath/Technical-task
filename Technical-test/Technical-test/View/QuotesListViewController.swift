//
//  QuotesListViewController.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import UIKit

class QuotesListViewController: UIViewController {
    
    private let dataManager:DataManager = DataManager()
    private var market:Market? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.fetchQuotes { result in
            print(result)
        }
        self.view.backgroundColor = .white
    }
    
}
