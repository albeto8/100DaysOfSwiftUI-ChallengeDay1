//
//  ContentView.swift
//  Challenge1
//
//  Created by Mario Alberto Barragán Espinosa on 13/10/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputIndex = 0
    @State private var outputIndex = 1
    @State private var inputValue = ""
    
    let temperatureUnits: [UnitTemperature] = [.celsius, .fahrenheit, .kelvin]
    
    var conversionResult: String {
        guard let unitValue = Double(inputValue) else {
            return "Invalid Input"
        }
        let value = Measurement(value: unitValue, unit: temperatureUnits[inputIndex])
        let convertedValue = value.converted(to: temperatureUnits[outputIndex])
        let formatted = String(format: "%.2f \(convertedValue.unit.symbol)", convertedValue.value)
        return "\(formatted)"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Temperature")) {
                    Picker("Choose your unit", selection: $inputIndex) {
                        ForEach(0..<temperatureUnits.count) {
                            Text("\(self.temperatureUnits[$0].symbol)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output Temperature")) {
                    Picker("Choose your unit", selection: $outputIndex) {
                        ForEach(0..<temperatureUnits.count) {
                            Text("\(self.temperatureUnits[$0].symbol)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Write your input")) {
                    TextField("\(temperatureUnits[inputIndex].symbol)", text: $inputValue)
                }
                
                Section(header: Text("Result")) {
                    Text(conversionResult)
                }
            }
            .navigationBarTitle("Unit conversions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
