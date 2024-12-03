//
//  TipCalculatorViewModelTests.swift
//  TipCalculatorTests
//
//  Created by Steven Shih on 12/3/24.
//

import XCTest
@testable import TipCalculator

final class TipCalculatorViewModelTests: XCTestCase {

    func testSubtotalUpdatesModel() {
        // Arrange
        let viewModel = TipCalculatorViewModel()
        
        // Act
        viewModel.subtotalStr = "120.50"
        
        // Assert
        XCTAssertEqual(viewModel.subtotal, 120.50)
    }
    
    func testTipPercentageUpdatesModel() {
        // Arrange
        let viewModel = TipCalculatorViewModel()
        
        // Act
        viewModel.tipPercentage = 18.0
        
        // Assert
        XCTAssertEqual(viewModel.tipCalculator.tipPercentage, 18.0)
    }
    
    func testDividedAmongUpdatesModel() {
        // Arrange
        let viewModel = TipCalculatorViewModel()
        
        // Act
        viewModel.dividedAmong = 5
        
        // Assert
        XCTAssertEqual(viewModel.tipCalculator.dividedAmong, 5)
    }
    
    func testTotalCalculationThroughViewModel() {
        // Arrange
        let viewModel = TipCalculatorViewModel()
        viewModel.subtotalStr = "200"
        viewModel.tipPercentage = 10

        // Act
        let total = viewModel.total

        // Assert
        XCTAssertEqual(total, 220.0, accuracy: 0.0001)
    }
    
    func testDividedTotalCalculationThroughViewModel() {
        // Arrange
        let viewModel = TipCalculatorViewModel()
        viewModel.subtotalStr = "300"
        viewModel.tipPercentage = 15
        viewModel.dividedAmong = 3

        // Act
        let dividedTotal = viewModel.dividedTotal

        // Assert
        XCTAssertEqual(dividedTotal, 115.0, accuracy: 0.0001) // (300 * 1.15) / 3
    }
    
    func testPaymentsAccessFromViewModel() {
        // Arrange
        let viewModel = TipCalculatorViewModel()

        // Act
        let payments = viewModel.payments

        // Assert
        XCTAssertEqual(payments.count, 4)
        XCTAssertEqual(payments.map { $0.methodName }, ["Venmo", "Zelle", "CashApp", "AppleCash"])
    }
}
