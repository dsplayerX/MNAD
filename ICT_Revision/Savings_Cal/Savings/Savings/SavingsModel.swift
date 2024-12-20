//
//  SavingsModel.swift
//  Savings
//
//  Created by Philip Trwoga on 16/10/2024.
//

import Foundation
import SwiftData

@Model class SavingsModel : Identifiable{

    //you vars here - hint use the names from the MainView
    //var futureValue:String
    //etc.
    var id: UUID = UUID()
    var initialAmount: String
    var monthlyContribution: String
    var interest: String
    var period: String
    var futureValue: String

    init(initialAmount: String, monthlyContribution: String, interest: String, period: String, futureValue: String) {
      //  self.futureValue = futureValue
        //etc
        self.initialAmount = initialAmount
        self.monthlyContribution = monthlyContribution
        self.interest = interest
        self.period = period
        self.futureValue = futureValue
    }
}
