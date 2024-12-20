//
//  ViewModel.swift
//  MathGame
//
//  Created by Dumindu Sameendra on 2024-11-26.
//


import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var numberOne: Int = Int.random(in: 1..<10)
    @Published var numberTwo: Int = Int.random(in: 1..<10)
    @Published var answer: String = ""
    @Published var isCorrect: Bool = false
    @Published var answered: Bool = false
    @AppStorage("points") var points: Int = 0
    @Published var op: Operators = Operators.allCases.randomElement()!
    @Published var correctAns: Int = 0
    //
    //    // Store color and font size in appstoragee
    //    @AppStorage("fontSize") var fontSize: Double = 16
    //    @AppStorage("systemColor") var selectedColor: String = AppTheme.blue.rawValue
    //
    //    // Get color and font size from storage
    //    var systemColor: AppTheme {
    //        get { AppTheme(rawValue: selectedColor) ?? .blue }
    //        set { selectedColor = newValue.rawValue }
    //    }
    
    @Published var selectedTheme: AppTheme = .blue // Default theme
    @Published var fontSize: CGFloat = 16.0 // Default font size
    
    var selectedColor: Color {
        selectedTheme.color
    }
    
    func handleSubmit(answer: String) {
        if let ans = Int(answer) {
            switch op {
            case .addition:
                correctAns = numberOne + numberTwo
            case .substraction:
                correctAns = numberOne - numberTwo
            case .division:
                correctAns = numberOne / numberTwo
            case .multiplication:
                correctAns = numberOne * numberTwo
            }
            if ans == correctAns {
                points += 1
                isCorrect = true
            } else {
                if points > 0 {
                    points -= 1
                }
                isCorrect = false
            }
        }
    }
    
    func generateRandomNumbers() {
        if !answered && points > 0 {
            points -= 1
        }
        numberOne = Int.random(in: 1..<10)
        numberTwo = Int.random(in: 1..<10)
        op = Operators.allCases.randomElement()!
        answered = false
        answer = ""
    }
    
    func resetScore() {
        points = 0
    }
    
}

