//
//  SettingsView.swift
//  CurrencyConverter
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

struct SettingsView: View {
    @Binding var defaultCurrency: Currency
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack (alignment: .leading) {
                    Text("Currency")
                    Picker("", selection: $defaultCurrency){
                        ForEach(Currency.allCases, id: \.self){ currency in
                            Text(currency.rawValue).tag(currency)
                        }
                    }.pickerStyle(WheelPickerStyle())
                }
                Spacer()
                Button("Reset Settings"){
                    defaultCurrency = .usd
                }.tint(.red)
            }
            .padding()
            .navigationTitle("Settings")
        }
    }
}

#Preview {
//    SettingsView()
    CustomTabView()
}
