//
//  GuessVM.swift
//  GuessTheNumber
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

enum ColorsEnum:String, CaseIterable {
    case red = "Ruby"
    case green = "Emerald"
    case blue = "Sapphire"
    
    var getColor: Color {
        switch self {
        case .red: return Color.red
        case .green: return Color.green
        case .blue: return Color.blue
        }
    }
}

enum Operators: String, CaseIterable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

class GuessVM: ObservableObject {
    // Settings related
    @AppStorage("storedFontSize") var fontSizeStorage: Double = 16
    @AppStorage("storedSystemColor") var systemColorStorage: String = ColorsEnum.blue.rawValue
    
    var fontSize: CGFloat {
        get{
            CGFloat(fontSizeStorage)
        }
        set {
            fontSizeStorage = Double(newValue)
            objectWillChange.send()
        }
    }
    
    var systemColor: ColorsEnum {
        get {
            ColorsEnum(rawValue: systemColorStorage)!
        }
        
        set {
            systemColorStorage = newValue.rawValue
            objectWillChange.send()
        }
    }
    
    // Game related
    @Published var number1: Int = Int.random(in: 0..<10)
    @Published var number2: Int = Int.random(in: 0..<10)
    @Published var op: Operators = Operators.allCases.randomElement()!
    @Published var answer: String = ""
    @Published var result: String = ""
    @AppStorage("score") var score: Int = 0
    @Published var alreadyAnswered: Bool = false
    
    // Checks the answer and updates the score
    func checkAnswer() {
        if answer == String(result) {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            }
        }
    }
    
    // Calculate and get the actual result
    func validateResult() {
        switch op {
        case .addition:
            result = String(number1 + number2)
        case .subtraction:
            result = String(number1 - number2)
        case .multiplication:
            result = String(number1 * number2)
        case .division:
            if number2 == 0 {
                generateQuestion()
            } else {
                result = String(number1 / number2)
            }
        }
    }
    
    // Generates a new question and sets the variables to defaults
    func generateQuestion() {
        number1 = Int.random(in: 0...9)
        number2 = Int.random(in: 0...9)
        op = Operators.allCases.randomElement()!
        answer = ""
        result = ""
        alreadyAnswered = false
    }
}
