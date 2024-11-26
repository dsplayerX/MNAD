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
        // Add other rates here
    ]
    
    @State private var text = "" // SAMPLE
    
    // SAMPLE INIT to demonstrate usage of caseiterable enums
    init() {
        let listOfCurrencies = Currencies.allCases // [.usd, .gbp]
        let stringValueOfUSD = listOfCurrencies[0].rawValue // "USD"
        let usdRate = rates[stringValueOfUSD] // 308.81
    }

    var body: some View {
        Text("Add home view content here")
//        TextField("", text: $text)
//            .onChange(of: text) { newValue in
//                print("Pass the functions below over here to convert")
//                print(newValue)
//            }
        
//        ForEach(Currencies.allCases, id: \.self) { currency in
//            Text(currency.rawValue)
//        }
        
    }
    
    // MARK: USE THESE FUNCTIONS WITHIN A SWIFTUI `onChange()` VIEW MODIFIER
    private func convert(newValue: String) {
        // To convert from foreign currency (F) to LKR you need to multiply the value of currency by the rate (R):
        // LKR = F * R
    }
    
    private func reverseConvert(newValue: String) {
        // To convert LKR to a foreign currency you need to divide the value of currency by the rate (R):
        // F = LKR / R
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
