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
    let metricOptions = ["seconds", "minutes", "hours", "days"]
    
    var computedVal : Double {
        var initialVal = conversionVal;
        if (inputMetric == "minutes") {
            initialVal *= 60
        } else if (inputMetric == "hours") {
            initialVal *= 3600
        } else if (inputMetric == "days") {
            initialVal *= 86400
        }
        
        
        if (outputMetric == "minutes") {
            return round(initialVal / 60 * 100) / 100.0
        } else if (outputMetric == "hours") {
            return round(initialVal / 3600 * 100) / 100.0
        } else if (outputMetric == "days") {
            return round(initialVal / 86400 * 100) / 100.0
        }
        
        return initialVal
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount to convert", value: $conversionVal, format: .number)
                        .keyboardType(.decimalPad)
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
                
                Section {
                    Text("\(conversionVal.formatted()) \(inputMetric) is \(computedVal.formatted()) \(outputMetric)")
                }

            }
            .navigationTitle("Time Bending")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
