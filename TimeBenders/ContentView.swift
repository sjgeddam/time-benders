//
//  ContentView.swift
//  TimeBenders
//
//  Created by Soujanya G on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputMetric = "seconds"
    @State private var outputMetric = "minutes"
    @State private var conversionVal = 0.0
    @FocusState private var amountIsFocused : Bool
    let metricOptions = ["seconds", "minutes", "hours", "days"]
    
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
                
                Section {
                    Picker("From ", selection: $inputMetric) {
                        ForEach(metricOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert from ")
                }
                
                Section {
                    Picker("To ", selection: $outputMetric) {
                        ForEach(metricOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("To")
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
