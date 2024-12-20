//
//  ContentView.swift
//  CurrencyConverter
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: CurrencyConvertorVM
    
    var body: some View {
        NavigationView (){
            VStack{
                HStack{
                    TextField("Enter foreign amount", text: $viewModel.foreignAmount).textFieldStyle(.roundedBorder).disabled(viewModel.switchCalculation).onChange(of: viewModel.foreignAmount){
                        if !viewModel.switchCalculation{
                            viewModel.convertToLKR()
                        }
                    }
                    Picker("Select currency", selection: $viewModel.selectedCurrency){
                        ForEach(Currency.allCases, id:\.self){ currency in
                            Text(currency.rawValue).tag(currency)
                        }
                    }
                }
                HStack{
                    TextField("Enter LKR amount", text: $viewModel.lkrAmount)
                        .textFieldStyle(.roundedBorder)
                        .disabled(!viewModel.switchCalculation)
                        .onChange(of: viewModel.lkrAmount){
                            if viewModel.switchCalculation{
                                viewModel.convertToForeign()
                            }
                        }
                    Text("LKR")
                }
                
                Toggle ("Switch calculation", isOn: $viewModel.switchCalculation)
                Spacer()
                
                Button{
                    viewModel.foreignAmount = ""
                    viewModel.lkrAmount = ""
                    viewModel.selectedCurrency = viewModel.defaultCurrency
                    viewModel.switchCalculation = false
                } label: {
                    Text("Reset Fields")
                }.tint(.red)
                
            }
            .padding()
            .navigationTitle("Currency Converter")
        }
    }
}

#Preview {
//    HomeView(defaultCurrency: .init(rawValue: "USD"))
    CustomTabView()
}
