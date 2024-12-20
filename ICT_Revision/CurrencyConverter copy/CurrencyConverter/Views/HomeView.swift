//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

struct HomeView: View {
    @Binding var defaultCurrency: Currency
    @State var foreignAmount: String = ""
    @State var lkrAmount: String = ""
    @State var selectedCurrency: Currency
    @State var switchCalculation: Bool = false
    
    init(defaultCurrency: Binding<Currency>){
        self._defaultCurrency = defaultCurrency
        self._selectedCurrency = State(
            initialValue: defaultCurrency.wrappedValue
        )
    }
    
    var body: some View {
        NavigationView (){
            VStack{
                HStack{
                    TextField("Enter foreign amount", text: $foreignAmount).textFieldStyle(.roundedBorder).disabled(switchCalculation).onChange(of: foreignAmount){
                        if !switchCalculation{
                            convertToLKR()
                        }
                    }
                    Picker("Select currency", selection: $selectedCurrency){
                        ForEach(Currency.allCases, id:\.self){ currency in
                            Text(currency.rawValue).tag(currency)
                        }
                    }
                }
                HStack{
                    TextField("Enter LKR amount", text: $lkrAmount)
                        .textFieldStyle(.roundedBorder)
                        .disabled(!switchCalculation)
                        .onChange(of: lkrAmount){
                            if switchCalculation{
                                convertToForeign()
                            }
                        }
                    Text("LKR")
                }
                
                Toggle ("Switch calculation", isOn: $switchCalculation)
                Spacer()
                
                Button{
                    foreignAmount = ""
                    lkrAmount = ""
                    selectedCurrency = defaultCurrency
                    switchCalculation = false
                } label: {
                    Text("Reset Fields")
                }.tint(.red)
                
            }
            .padding()
            .navigationTitle("Currency Converter")
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

#Preview {
//    HomeView(defaultCurrency: .init(rawValue: "USD"))
    CustomTabView()
}
