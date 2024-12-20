//
//  ViewModel.swift
//  Savings
//
//  Created by Dumindu Sameendra on 2024-12-05.
//

import Foundation
import SwiftUI
import SwiftData

class ViewModel: ObservableObject {
    @AppStorage("initialAmount") var initialAmount = "0"
    @AppStorage("monthlyContribution") var monthlyContribution = "250"
    @AppStorage("interest") var interest = "2"
    @AppStorage("period") var period = "5"
    @Published var futureValue = "£0.00"
    
    private var modelContext: ModelContext?

    // Set ModelContext explicitly
    func setModelContext(_ context: ModelContext) {
        self.modelContext = context
    }
    
    //uncomment this function when ready
    func calculateSavings(){
        var periodD = 0
        var annualInterestRateD = 0.0
        var initialAmountD = 0.0
        var monthlyContributionD = 0.0
        if !interest.isEmpty{
            annualInterestRateD = Double(interest)!
        }
        if !period.isEmpty{
            periodD = Int(period)!
        }
        if !initialAmount.isEmpty{
            initialAmountD = Double(initialAmount)!
        }
        if !monthlyContribution.isEmpty{
            monthlyContributionD = Double(monthlyContribution)!
        }
        
        let monthlyInterestRate = annualInterestRateD / 12 / 100
        let months = periodD * 12
        var totalSavings = initialAmountD
        
        for _ in 1...months {
            totalSavings += monthlyContributionD
            totalSavings += totalSavings * monthlyInterestRate
//            print(totalSavings)
        }
        futureValue = String(format: "£%.2f",totalSavings)
        
        //insert a new model instance into the model context
        let savings = SavingsModel(initialAmount: initialAmount, monthlyContribution: monthlyContribution, interest: interest, period: period, futureValue: futureValue)
        modelContext!.insert(savings)
        //now hide the keyboard
        hideKeyboard()
    }
    
    //uncomment this function when ready
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
