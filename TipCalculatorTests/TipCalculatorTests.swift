//
//  TipCalculatorTests.swift
//  TipCalculatorTests
//
//  Created by Steven Shih on 12/3/24.
//

import XCTest
@testable import TipCalculator

final class TipCalculatorTests: XCTestCase {
    
    func testValidTipCalculationWithSinglePerson() throws {
        // Arrange (GIVEN)
        let subtotal = 100.00
        let tipPercentage = 15.00
        let calculation = TipCalculator()
        
        // Act (WHEN)
        let totalWithTip = calculation.calculateTip(of: subtotal, with: tipPercentage)
        
        // Assert (THEN)
        XCTAssertEqual(totalWithTip!, 115.00, accuracy: 0.00001)
    }
    
    func testValidTipCalculationWithMultiplePeople() throws {
        // Arrange
        let subtotal = 200.00
        let tipPercentage = 20.00
        let dividedAmong = 4
        let calculation = TipCalculator()
        
        // Act
        let totalWithTip = calculation.calculateTip(of: subtotal, with: tipPercentage, by: dividedAmong)
        
        // Assert
        XCTAssertEqual(totalWithTip!, 60.00, accuracy: 0.00001) // (200 * 1.2) / 4
    }
    
    func testTipCalculationWithZeroTip() throws {
        // Arrange
        let subtotal = 50.00
        let tipPercentage = 0.00
        let calculation = TipCalculator()
        
        // Act
        let totalWithTip = calculation.calculateTip(of: subtotal, with: tipPercentage)
        
        // Assert
        XCTAssertEqual(totalWithTip!, 50.00, accuracy: 0.00001)
    }
    
    func testTipCalculationWithZeroAmount() throws {
        // Arrange
        let subtotal = 0.00
        let tipPercentage = 10.00
        let calculation = TipCalculator()
        
        // Act
        let totalWithTip = calculation.calculateTip(of: subtotal, with: tipPercentage)
        
        // Assert
        XCTAssertEqual(totalWithTip!, 0.00, accuracy: 0.00001)
    }
    
    func testTipCalculationReturnsNilForNegativeSubtotal() throws {
        // Arrange
        let subtotal = -50.00
        let tipPercentage = 15.00
        let calculation = TipCalculator()
        
        // Act
        let totalWithTip = calculation.calculateTip(of: subtotal, with: tipPercentage)
        
        // Assert
        XCTAssertNil(totalWithTip)
    }
    
    func testTipCalculationReturnsNilForNegativeTip() throws {
        // Arrange
        let subtotal = 100.00
        let tipPercentage = -10.00
        let calculation = TipCalculator()
        
        // Act
        let totalWithTip = calculation.calculateTip(of: subtotal, with: tipPercentage)
        
        // Assert
        XCTAssertNil(totalWithTip)
    }
    
    func testDefaultParameterUsageWithSinglePerson() throws {
        // Arrange
        let subtotal = 80.00
        let tipPercentage = 25.00
        let calculation = TipCalculator()
        
        // Act
        let totalWithTip = calculation.calculateTip(of: subtotal, with: tipPercentage)
        
        // Assert
        XCTAssertEqual(totalWithTip!, 100.00, accuracy: 0.00001) // Default `by = 1`
    }
    
    func testDefaultParameterUsageWithMultiplePeople() throws {
        // Arrange
        let subtotal = 120.00
        let tipPercentage = 10.00
        let dividedAmong = 3
        let calculation = TipCalculator()
        
        // Act
        let totalWithTip = calculation.calculateTip(of: subtotal, with: tipPercentage, by: dividedAmong)
        
        // Assert
        XCTAssertEqual(totalWithTip!, 44.00, accuracy: 0.00001) // (120 * 1.1) / 3
    }
    
    func testEdgeCaseWithLargeNumbers() throws {
        // Arrange
        let subtotal = 1_000_000.00
        let tipPercentage = 5.00
        let calculation = TipCalculator()
        
        // Act
        let totalWithTip = calculation.calculateTip(of: subtotal, with: tipPercentage)
        
        // Assert
        XCTAssertEqual(totalWithTip!, 1_050_000.00, accuracy: 0.00001)
    }
    
    func testEdgeCaseWithDividingAmongZero() throws {
        // Arrange
        let subtotal = 100.00
        let tipPercentage = 15.00
        let dividedAmong = 0
        let calculation = TipCalculator()
        
        // Act
        let totalWithTip = calculation.calculateTip(of: subtotal, with: tipPercentage, by: dividedAmong)
        
        // Assert
        XCTAssertNil(totalWithTip) // Dividing by 0 isn't valid
    }
}
