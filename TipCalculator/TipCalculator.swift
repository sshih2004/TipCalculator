//
//  TipCalculator.swift
//  TipCalculator
//
//  Created by Steven Shih on 12/3/24.
//

import Foundation

struct TipCalculator {
    private(set) var subtotal: Double = 0
    private(set) var tipPercentage: Double = 0
    private(set) var dividedAmong: Int = 1
    private(set) var payments: [Payment] = [Payment(methodName: "Venmo", paymentId: "VenmoID"), Payment(methodName: "Zelle", paymentId: "ZelleID"), Payment(methodName: "CashApp", paymentId: "CashAppID"), Payment(methodName: "AppleCash", paymentId: "AppleCashID")]
    var total: Double {
        calculateTip(of: subtotal, with: tipPercentage) ?? 0
    }
    var dividedTotal: Double {
        calculateTip(of: subtotal, with: tipPercentage, by: dividedAmong) ?? 0
    }
    
    func calculateTip(of enteredAmount: Double, with tip: Double, by dividedAmong: Int = 1) -> Double? {
        guard enteredAmount >= 0 && tip >= 0 && dividedAmong > 0 else { return nil }
        let tipPercentage = tip / 100
        return enteredAmount * (1 + tipPercentage) / Double(dividedAmong)
    }
    
    mutating func setSubtotal(to subtotal: Double) {
        self.subtotal = subtotal
    }
    
    mutating func setTipPercentage(to tipPercentage: Double) {
        self.tipPercentage = tipPercentage
    }
    
    mutating func setDividedAmong(to dividedAmong: Int) {
        self.dividedAmong = dividedAmong
    }
}

struct Payment: Hashable, Identifiable {
    var methodName: String
    var paymentId: String
    var id = UUID()
    var imagePath: String?
}
