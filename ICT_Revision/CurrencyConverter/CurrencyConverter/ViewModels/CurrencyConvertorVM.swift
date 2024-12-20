//
//  CurrencyConvertorVM.swift
//  CurrencyConverter
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

class CurrencyConvertorVM: ObservableObject {
    @AppStorage("defaultCurrency") private var storedDefaultCurrency: String = Currency.usd.rawValue
    
    @Published var foreignAmount: String = ""
    @Published var lkrAmount: String = ""
    @Published var selectedCurrency: Currency
    @Published var switchCalculation: Bool = false
    
    init() {
        let initialCurrency = UserDefaults.standard.string(forKey: "defaultCurrency") ?? Currency.usd.rawValue
        self.selectedCurrency = Currency(rawValue: initialCurrency) ?? .usd
    }
    
    var defaultCurrency: Currency {
        get {
            Currency(rawValue: storedDefaultCurrency) ?? .usd
        }
        set {
            storedDefaultCurrency = newValue.rawValue
        }
    }
    
    
    
    func convertToLKR(){
        let foreignAmountDouble = Double(foreignAmount) ?? 0
        let lkrAmountDouble = foreignAmountDouble * selectedCurrency.getRate()
        lkrAmount = String(format: "%.2f", lkrAmountDouble)
    }
    
    func convertToForeign(){
        let lkrAmountDouble = Double(lkrAmount) ?? 0
        let foreignAmountDouble = lkrAmountDouble / selectedCurrency.getRate()
        foreignAmount = String(format: "%.2f", foreignAmountDouble)
    }
}
