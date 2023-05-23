//
//  FavoriteManagerTests.swift
//  Technical-testTests
//
//  Created by Bogdan Deshko on 23.05.2023.
//

import XCTest
@testable import Technical_test

final class FavoriteManagerTests: XCTestCase {
    var sut: FavoritesManager!
    
    override func setUpWithError() throws {
       sut = DefaultFavoritesManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testAddQuote() {
        sut.add(quote: "test")
        XCTAssertTrue(sut.contains(quote: "test"))
    }
    
    func testRemoveQuote() {
        sut.add(quote: "test")
        sut.remove(quote: "test")
        
        XCTAssertFalse(sut.contains(quote: "test"))
    }
}
