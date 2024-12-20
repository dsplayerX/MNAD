//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

enum Operators: String, CaseIterable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
}

struct GuessView: View {
    @Binding var fontSize: CGFloat
    @Binding var systemColor: ColorsEnum
    
    @State var number1: Int = Int.random(in: 0..<10)
    @State var number2: Int = Int.random(in: 0..<10)
    @State var op: Operators = Operators.allCases.randomElement()!
    @State var answer: String = ""
    @State var result: String = ""
    @State var score: Int = 0
    @State var alreadyAnswered: Bool = false
    
    var body: some View {
        VStack {
            Text("Guess the answer!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(systemColor.getColor)
                .padding(20)
            
            Text("What is \(number1) \(op.rawValue) \(number2)?")
                .font(.title).bold()
            HStack {
                TextField("Answer", text: $answer).textFieldStyle(.plain)
                Button("Submit") {
                    alreadyAnswered = true
                    checkAnswer()
                }.disabled(alreadyAnswered).buttonStyle(.bordered).tint(.blue)
            }.padding(20).border(Color.black)
            
            if alreadyAnswered {
                if answer == String(result) {
                    Label("CORRECT ANSWER! WELL DONE", systemImage: "checkmark.circle.fill").foregroundColor(Color.green)
                } else {
                    Label("Incorrect Answer! Actual Answer is \(result).", systemImage: "xmark.circle.fill").foregroundColor(Color.red)
                }
            }
            Spacer()
            
            Text("\(score)").font(.system(size: 72)).bold()
            Spacer()
            VStack{
                Text("Instructions").padding()
                Text("Submit the correct ansawer and gain 1 point. Submit a wrong answer or press \"NEXT\" and you will lose 1 point.")
            }.font(.system(size: fontSize))
            Spacer()
            Button("Next Question") {
                if !alreadyAnswered {
                    checkAnswer()
                }
                generateQuestion()
                validateResult()
            }.buttonStyle(.bordered).tint(Color.green)
        }
        .padding()
        .onAppear {
            generateQuestion()
            validateResult()
        }
    }
    
    func checkAnswer() {
        if answer == String(result) {
            score += 1
        } else {
            if score > 0 {
                score -= 1
            }
        }
    }
    
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
    
    func generateQuestion() {
        number1 = Int.random(in: 0...9)
        number2 = Int.random(in: 0...9)
        op = Operators.allCases.randomElement()!
        answer = ""
        result = ""
        alreadyAnswered = false
    }
}

#Preview {
    CustomTabView()
//    GuessView(fontSize: .constant(12), systemColor: .constant(ColorsEnum.red))
}
