//
//  FavoritesManager.swift
//  Technical-test
//
//  Created by Bogdan Deshko on 23.05.2023.
//

import Foundation

protocol FavoritesManager {
    func add(quote: String)
    func remove(quote: String)
    func contains(quote: String) -> Bool
}

class DefaultFavoritesManager: FavoritesManager {
    private var favoritesQuotes = Set<String>()
    
    func add(quote: String) {
        favoritesQuotes.insert(quote)
    }
    
    func remove(quote: String) {
        favoritesQuotes.remove(quote)
    }
    
    func contains(quote: String) -> Bool {
        favoritesQuotes.contains(quote)
    }
}
