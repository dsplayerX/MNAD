//
//  SettingsView.swift
//  MNADStarter
//
//  Created by Visal Rajapakse on 2023-06-30.
//

import SwiftUI

enum Currencies: String, CaseIterable {
    case usd = "USD"
    case gbp = "GBP"
    case aud = "AUD"
    case cad = "CAD"
    case euro = "EUR"
}

struct SettingsView: View {
    
    @Binding var selectedCurrency: String
    
    var body: some View {
        VStack {
            Picker("Pick a currency", selection: $selectedCurrency) {
                ForEach(Currencies.allCases, id: \.self) { currency in
                    Text(currency.rawValue).tag(currency.rawValue)
                }
            }.padding().pickerStyle(.inline).onChange(of: selectedCurrency) { newValue in
                selectedCurrency = newValue
                print("Settings selected Currency: \(selectedCurrency)")
            }
            Spacer()
            Button("Reset Settings") {
                selectedCurrency = Currencies.usd.rawValue
            }.padding().tint(.red).buttonStyle(.bordered)
            
        }
    }
}
    
//    struct SettingsView_Previews: PreviewProvider {
//        static var previews: some View {
//            SettingsView()
//        }
//    }
//
#Preview {
    CustomTabView()
}
//    


