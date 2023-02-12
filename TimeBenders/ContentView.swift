//
//  ContentView.swift
//  TimeBenders
//
//  Created by Ram G on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputMetric = "seconds"
    @State private var outputMetric = "minutes"
    @State private var conversionVal = 0.0
    @FocusState private var amountIsFocused : Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount to convert", value: $conversionVal, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Enter amount to convert")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
