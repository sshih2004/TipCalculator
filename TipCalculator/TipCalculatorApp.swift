//
//  TipCalculatorApp.swift
//  TipCalculator
//
//  Created by Steven Shih on 12/3/24.
//

import SwiftUI

@main
struct TipCalculatorApp: App {
    @StateObject var tipCalculatorVM = TipCalculatorViewModel()
    var body: some Scene {
        WindowGroup {
            TipCalculatorView(tipCalculatorViewModel: tipCalculatorVM)
        }
    }
}
