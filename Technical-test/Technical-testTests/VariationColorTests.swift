//
//  VariationColorTests.swift
//  Technical-testTests
//
//  Created by Bogdan Deshko on 23.05.2023.
//

import XCTest
@testable import Technical_test

final class VariationColorTests: XCTestCase {
    
    var sut: VariationColor!
    
    override func setUpWithError() throws {
        sut = VariationColor(rawValue: "red")
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testRedColor() {
        XCTAssertEqual(sut.color, .red)
    }
    
    func testGreenColor() {
        sut = VariationColor(rawValue: "green")
        XCTAssertEqual(sut.color, .green)
    }
}
