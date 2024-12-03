//
//  DexcomG7.swift
//  TipCalculator
//
//  Created by Steven Shih on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0 // For TabView
    @State private var selectedTime = "3 Hours" // For Segmented Control
    
    var body: some View {
        ZStack {
            VStack {
                // Top Section (Value in a Circle)
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                        .overlay {
                            VStack {
                                Text("110")
                                    .font(.system(size: 48, weight: .bold))
                                    .foregroundColor(.black)
                                Text("mg/dL")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                }
                .frame(width: 150, height: 150)
                .padding(.top, 20)
                
                // Segmented Control
                HStack {
                    ForEach(["3", "6", "12", "24"], id: \.self) { time in
                        Text(time)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .background(selectedTime == time ? Color.gray.opacity(0.2) : Color.clear)
                            .cornerRadius(10)
                            .onTapGesture {
                                selectedTime = time
                            }
                    }
                }
                .padding(.horizontal)
                
                // Graph Section (Mockup)
                VStack {
                    // Graph View Placeholder
                    Rectangle()
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 150)
                        .cornerRadius(10)
                        .overlay(
                            Text("Graph Placeholder") // Replace with a custom Path or Chart
                                .foregroundColor(.gray)
                        )
                        .padding(.horizontal)
                    
                    // X-Axis Labels
                    HStack {
                        Text("12PM")
                        Spacer()
                        Text("1PM")
                        Spacer()
                        Text("2PM")
                        Spacer()
                        Text("Now")
                    }
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                }
                CardView {
                    VStack {
                        Text("Dynamic Content")
                            .font(.headline)
                        Text("You can place any view here!")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                // Spacer for Layout
                Spacer()
                
                // Tab Bar Section
                TabView(selection: $selectedTab) {
                    Text("Glucose")
                        .tabItem {
                            Image(systemName: "circle.fill")
                            Text("Glucose")
                        }
                        .tag(0)
                    Text("History")
                        .tabItem {
                            Image(systemName: "doc.text")
                            Text("History")
                        }
                        .tag(1)
                    Text("Connections")
                        .tabItem {
                            Image(systemName: "link")
                            Text("Connections")
                        }
                        .tag(2)
                    Text("Profile")
                        .tabItem {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                        .tag(3)
                }
                
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        print("+ Button Tapped")
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                }
                Spacer()
                    
            }
        }
    }
}

struct CardView<Content: View>: View {
    var content: () -> Content
    
    var body: some View {
        content()
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    ContentView()
}
