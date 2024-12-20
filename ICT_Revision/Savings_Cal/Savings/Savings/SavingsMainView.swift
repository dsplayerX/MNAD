//
//  SavingsMainView.swift
//  Savings
//
//  Created by Philip Trwoga on 14/10/2024.
//

import SwiftUI
import SwiftData

struct SavingsMainView: View {
    @FocusState private var fieldIsFocused: Bool
    //your vars here
//    @AppStorage("initialAmount") var initialAmount: String = ""
//    @AppStorage("monthlyContribution") var monthlyContribution: String = "250"
//    @AppStorage("interest") var interest: String = "2"
//    @AppStorage("period") var period: String = "5"
//    @State var futureValue: String = "£0.00"
    
    @StateObject var viewModel = ViewModel()
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        
        VStack{
            //put your code here for the main UI
            //pattern is:
            //labels and textfields
            //button
            //payment output text
            Text("Savings Calculator").font(.system(size: 32)).padding()
            HStack
            {
                Label("Initial Amount", systemImage: "sterlingsign")
                TextField("Enter Initial Amount", text: $viewModel.initialAmount)
                    .keyboardType(.decimalPad).padding(10).border(Color.black)
                    .focused($fieldIsFocused)
                    .onSubmit {
                        fieldIsFocused = false
                    }
            }.padding()
            HStack
            {
                Label("Monthly Payment", systemImage: "banknote")
                Spacer()
                TextField(
                    "Enter Initial Amount",
                    text: $viewModel.monthlyContribution
                )
                .frame(width: 100)
                .keyboardType(.decimalPad)
                .padding(10)
                .border(Color.black)
                .focused($fieldIsFocused)
                .onSubmit {
                    fieldIsFocused = false
                }
            }.padding()
            HStack
            {
                Label("Interest", systemImage: "percent")
                TextField("Enter Initial Amount", text: $viewModel.interest).keyboardType(.decimalPad)
                    .padding(10)
                    .border(Color.black)
                    .focused($fieldIsFocused)
                    .onSubmit {
                        fieldIsFocused = false
                    }
                
            }.padding()
            HStack
            {
                Label("Period(years)", systemImage: "calendar")
                TextField("Enter Initial Amount", text: $viewModel.period).keyboardType(.decimalPad)
                    .padding(10)
                    .border(Color.black)
                    .focused($fieldIsFocused)
                    .onSubmit {
                        fieldIsFocused = false
                    }
                
            }.padding()
            
            Button("Calculate Future Value", action: {
                viewModel.calculateSavings()
            }).padding()
            
            Text("The future value is: \(viewModel.futureValue)")
        }.onAppear {
            viewModel.setModelContext(modelContext)
        }.onTapGesture {
            viewModel.hideKeyboard() // Dismiss keyboard when tapping outside fields
        }
    }
}

#Preview {
    SavingsMainView()
}
