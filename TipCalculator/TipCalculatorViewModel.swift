//
//  TipCalculatorViewModel.swift
//  TipCalculator
//
//  Created by Steven Shih on 12/3/24.
//

import Foundation

class TipCalculatorViewModel: ObservableObject {
    var tipCalculator: TipCalculator = TipCalculator()
    var subtotal: Double {
        tipCalculator.subtotal
    }
    var total: Double {
        tipCalculator.total
    }
    var dividedTotal: Double {
        tipCalculator.dividedTotal
    }
    var payments: [Payment] {
        tipCalculator.payments
    }
    @Published var subtotalStr: String = "" {
        didSet {
            tipCalculator.setSubtotal(to: Double(subtotalStr) ?? 0)
        }
    }
    @Published var tipPercentage: Double = 0.0 {
        didSet {
            tipCalculator.setTipPercentage(to: tipPercentage)
        }
    }
    @Published var dividedAmong: Int = 1 {
        didSet {
            tipCalculator.setDividedAmong(to: dividedAmong)
        }
    }
}
