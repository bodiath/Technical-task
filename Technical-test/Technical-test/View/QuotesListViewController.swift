//
//  QuotesListViewController.swift
//  Technical-test
//
//  Created by Patrice MIAKASSISSA on 29.04.21.
//

import UIKit

class QuotesListViewController: UIViewController {
    
    private let dataManager:DataManager = DataManager()
    private let favoritesManager: FavoritesManager = DefaultFavoritesManager()
    private var market:Market? = nil
    
    private let tableView = UITableView()
    fileprivate var quotes = [Quote]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuotes()
        setupTableView()
        self.view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
   private func getQuotes() {
        dataManager.fetchQuotes { result in
            switch result {
            case .success(let quotes):
                self.quotes = quotes
                print(quotes)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print(error.errorDescription)
            }
        }
    }
    
   private func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UINib(nibName: QuotesTableViewCell.reuseIdentifier, bundle: nil),
                           forCellReuseIdentifier: QuotesTableViewCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
}

extension QuotesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuotesTableViewCell.reuseIdentifier, for: indexPath) as! QuotesTableViewCell
        
        let isFavorite = favoritesManager.containce(quote: quotes[indexPath.row].name)
        
        cell.setupCell(quote: self.quotes[indexPath.row], isFavorite: isFavorite)
        
        return cell
    }
    
    
}

extension QuotesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = QuoteDetailsViewController(quote: quotes[indexPath.row], favoritesManager: favoritesManager)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
