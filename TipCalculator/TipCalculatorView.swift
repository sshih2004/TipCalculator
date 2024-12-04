//
//  ContentView.swift
//  TipCalculator
//
//  Created by Steven Shih on 12/3/24.
//

import SwiftUI

struct TipCalculatorView: View {
    @ObservedObject var tipCalculatorViewModel: TipCalculatorViewModel
    @State var showPayments = false
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Form {
                    Section("Input") {
                        HStack {
                            Text("$")
                            TextField("Subtotal: ", text: $tipCalculatorViewModel.subtotalStr)
                        }
                    }
                    Section("Tip") {
                        Slider(value: $tipCalculatorViewModel.tipPercentage, in: 0...100, step: 1)
                        Text("Tip Percentage: \(tipCalculatorViewModel.tipCalculator.tipPercentage.formatted())%")
                    }
                    Section("Split") {
                        Picker(selection: $tipCalculatorViewModel.dividedAmong) {
                            ForEach(1...12, id: \.self) { num in
                                Text("\(num)")
                                    .tag(num)
                            }
                        } label: {
                            Text("Divided Among \(tipCalculatorViewModel.dividedAmong) \(tipCalculatorViewModel.dividedAmong > 1 ? "People" : "Person")")
                        }
                        .accessibilityIdentifier("SplitPicker")
                        
                    }
                    Section("Pay") {
                        Text("Pay Electronically")
                            .onTapGesture {
                                showPayments = true
                            }
                    }
                }
            }
            VStack {
                Spacer()
                HStack(alignment: .center) {
                    Circle()
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                        .overlay {
                            VStack {
                                Text("\(tipCalculatorViewModel.dividedTotal.formatted(.currency(code: "USD")))")
                                    .font(.system(size: 48, weight: .bold))
                                    .foregroundColor(.black)
                                Text("including tip")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(maxWidth: 200, maxHeight: 200)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 50)
            }
        }
        .sheet(isPresented: $showPayments) {
            NavigationStack {
                List(tipCalculatorViewModel.payments) { payment in
                    NavigationLink(value: payment) {
                        Text(payment.methodName)
                    }
                }
                .navigationDestination(for: Payment.self) { payment in
                    VStack {
                        Rectangle()
                            .fill(.gray)
                            .frame(maxWidth: 250, maxHeight: 250)
                            .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                            .overlay {
                                if let imagePath = payment.imagePath {
                                    // TODO: Fetch image from file system through ViewModel
                                } else {
                                    Text("QR Code Placeholder")
                                        .font(.system(size: 20))
                                }
                            }
                            .padding()
                        Text(payment.paymentId)
                            .font(.system(size: 25))
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    TipCalculatorView(tipCalculatorViewModel: TipCalculatorViewModel())
}
