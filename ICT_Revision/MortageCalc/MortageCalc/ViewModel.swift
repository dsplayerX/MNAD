//
//  ViewModel.swift
//  MortageCalc
//
//  Created by Dumindu Sameendra on 2024-12-05.
//

import SwiftUI

class MortgageViewModel: ObservableObject {
    //declare vars
    @AppStorage("monthlyPayment") var monthlyPayment:String = "300000.00"
    @AppStorage("interestRate") var interestRate:String = "4.00"
    @AppStorage("loanTerm") var loanTerm:String = "25"
    @Published var borrowableAmount:Double = 0
    
    func mortgageCalculator(){ //note this will be moved to a separate class and recoded t
        //note use pow(a,b)
        //convert var to doubles for the calculation
        let monthlyPaymentDouble = (Double(monthlyPayment)!)
        let loanTermInt = Double(loanTerm)!
        let interestRateDouble = (Double(interestRate)!)
        
        let r = interestRateDouble / 100
        
        let A = (r/12)+1
        
        let n = loanTermInt * 12
        
        let P = (monthlyPaymentDouble * (pow(A, n) - 1) * (pow(A, ( -1 * n )))) / (r/12)
        
        borrowableAmount = P
    }
    
    //takes a string and returns a string
    func checkText(text:String)->String{
        var updatedString = text
        var dotCount = 0
        for d in text {
            if String(d) == "."
            { dotCount += 1 }
        }
        if dotCount >= 2 {
            // remove the last typed point
            updatedString = String(text.dropLast())
        }
        return updatedString
    }
}
