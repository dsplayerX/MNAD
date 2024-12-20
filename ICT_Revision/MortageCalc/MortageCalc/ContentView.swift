//
//  ContentView.swift
//  MortageCalc
//
//  Created by Dumindu Sameendra on 2024-12-05.
//

import SwiftUI
struct ContentView: View {
    
    @StateObject var viewModel = MortgageViewModel()
    
    var body: some View {
        ZStack{
            Image("background").resizable().edgesIgnoringSafeArea(.all).opacity(0.5)
            VStack {
                Text("Mortgage Calculator").bold().font(.title).padding(EdgeInsets(top: 10, leading: 10, bottom: 100, trailing: 10))
                //Image(...)
                //                Label(...)
                //Textfield(...)
                //.onChange(of: ...) {newValue in ...}
                //times 3 - one for each entry
                //Button(...)
                //Text()
                Label("Monthly Payment", systemImage: "sterlingsign.circle.fill")
                TextField("Enter Monthly Payment", text: $viewModel.monthlyPayment).padding(10).border(Color.blue).onChange(of: viewModel.monthlyPayment) {newValue in
                    viewModel.monthlyPayment = viewModel.checkText(text: newValue)
                }.keyboardType(.decimalPad)
                
                Label("Loan Period", systemImage: "clock.badge.questionmark")
                TextField("Enter Load Period", text: $viewModel.loanTerm).padding(10)
                    .border(Color.blue).onChange(of: viewModel.loanTerm){ newValue in
                        viewModel.loanTerm = viewModel.checkText(text: newValue)}.keyboardType(.decimalPad)
                Label("Interest Rate", systemImage: "percent")
                TextField("Enter Interest Rate", text: $viewModel.interestRate).padding(10)
                    .border(Color.blue).onChange(of: viewModel.interestRate) {newValue in
                        viewModel.interestRate = viewModel.checkText(text: newValue)}.keyboardType(.decimalPad)
                
                Button("Calculate") {
                    viewModel.mortgageCalculator()
                }.padding()
                
                Text(
                    "Amount that can be borrowed: £\(String(format: "%.2f", viewModel.borrowableAmount))"
                )
            }.padding()
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
