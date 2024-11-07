//
//  ContentView.swift
//  MNADStarter
//
//  Created by Visal Rajapakse on 2023-06-30.
//

import SwiftUI

struct HomeView: View {
    
    // Dictionary to get the rate agains the LKR for a given currency
    let rates = [
        "USD": 308.81,
        "GBP": 390.31,
        "AUD": 204.40,
        "CAD": 232.82,
        "EUR": 334.92
    ]
    
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var switchCalculation = false
    @Binding var selectedCurrency: String

    
    // SAMPLE INIT to demonstrate usage of caseiterable enums
//    init() {
//        let listOfCurrencies = Currencies.allCases // [.usd, .gbp]
//        let stringValueOfUSD = listOfCurrencies[0].rawValue // "USD"
//        let usdRate = rates[stringValueOfUSD] // 308.81
//    }

    var body: some View {
        VStack {
            HStack {
                TextField("Foreign Currency", text: $text1)
                    .onChange(of: text1) { newValue in
                        if !switchCalculation, let convertedValue = convert(newValue: newValue) {
                            print("Converted Value: \(convertedValue)")
                            text2 = String(format: "%.2f", convertedValue)
                        }
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding().disabled(switchCalculation)
                
                Picker("Pick a currency", selection: $selectedCurrency) {
                    ForEach(Currencies.allCases, id: \.self) { currency in
                        Text(currency.rawValue).tag(currency.rawValue)
                    }
                    .padding()
                    .onChange(of: selectedCurrency) { newValue in
                        selectedCurrency = newValue
                        print("Selected Currency: \(selectedCurrency)")
                        if !switchCalculation, let convertedValue = convert(newValue: text1) {
//                            print("Converted Value: \(convertedValue)")
                            text2 = String(format: "%.2f", convertedValue)
                        }
                        if switchCalculation, let reverseConvertedValue = reverseConvert(newValue: text2) {
//                            print("Reverse Converted Value: \(reverseConvertedValue)")
                            text1 = String(format: "%.2f", reverseConvertedValue)
                        }
                    }
                }
            }
            
            HStack{
                TextField("Sri Lankan Currency", text: $text2)
                    .onChange(of: text2) { newValue in
                        if switchCalculation, let reverseConvertedValue = reverseConvert(newValue: newValue) {
                            print("Reverse Converted Value: \(reverseConvertedValue)")
                            text1 = String(format: "%.2f", reverseConvertedValue)
                        }
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding().disabled(!switchCalculation)
                Text("LKR").padding()
            }
            
            Toggle(isOn: $switchCalculation) {
                Text("Switch calculation")
            }.padding()
            
            Spacer()
            
            Button("Reset Fields") {
                            text1 = ""
                            text2 = ""
                        }
            .padding().tint(.red).buttonStyle(.bordered)
        }
    }

    
    // MARK: USE THESE FUNCTIONS WITHIN A SWIFTUI `0onChange()` VIEW MODIFIER
    private func convert(newValue: String) -> Double? {
        // To convert from foreign currency (F) to LKR you need to multiply the value of currency by the rate (R):
        // LKR = F * R
        guard let foreignCurrencyValue = Double(newValue) else {
            print("Invalid number format")
            return nil
        }
        
        let rate = rates[selectedCurrency]
//        print("Rate: \(String(describing: rate))")

        guard let rate else {
            print("Invalid rate")
            return nil
        }

        let lkrValue = foreignCurrencyValue * rate
        return lkrValue
    }
    
    private func reverseConvert(newValue: String) -> Double? {
        // To convert LKR to a foreign currency you need to divide the value of currency by the rate (R):
        // F = LKR / R
        guard let lkrValue = Double(newValue) else {
            print("Invalid number format")
            return nil
        }
//        print("LKR: \(lkrValue)")
        
        let rate = rates[selectedCurrency]
//        print("Rate: \(String(describing: rate))")

        guard let rate else {
            print("Invalid rate")
            return nil
        }


        let foreignCurrencyValue = lkrValue / rate
        return foreignCurrencyValue
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}

#Preview {
    CustomTabView()
}

