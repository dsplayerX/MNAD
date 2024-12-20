//
//  ContentView.swift
//  MathGame
//
//  Created by Dumindu Sameendra on 2024-11-26.
//

import SwiftUI

enum Operators: String, CaseIterable {
    case addition = "+"
    case substraction = "-"
    case division = "/"
    case multiplication = "*"
}

struct GuessView: View {
    
//    @State var numberOne: Int = Int.random(in: 0..<10)
//    @State var numberTwo: Int = Int.random(in: 1..<10)
//    @State var answer: String = ""
//    @State var isCorrect: Bool = false
//    @State var answered: Bool = false
//    @AppStorage("points") var points: Int = 0
//    @State var op: Operators = Operators.allCases.randomElement()!
//    @State var correctAns: Int = 0
//    
//    @Binding var selectedColor: Color
//    @Binding var fontSize: CGFloat
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Guess the answer!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(viewModel.selectedColor)
            Spacer()
            VStack {
                Text("What's \(viewModel.numberOne) \(viewModel.op.rawValue) \(viewModel.numberTwo)?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                HStack{
                    TextField("Answer", text: $viewModel.answer)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .keyboardType(.numbersAndPunctuation)
                    Button(action: {
                        if !viewModel.answered {
                            viewModel.handleSubmit(answer: viewModel.answer)
                            viewModel.answered = true
                        }
                        print(viewModel.answer)
                    }) {
                        Text("Submit")
                    }.disabled(viewModel.answered).padding(10).accentColor(.blue).buttonStyle(
                        .borderedProminent
                    )
                }
                if viewModel.answered {
                    if viewModel.isCorrect {
                        HStack{
                            Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                            Text("CORRECT ANSWER! WELL DONE!").foregroundColor(.green)
                        }
                    } else {
                        Image(systemName: "x.circle.fill").foregroundColor(.red)
                        Text("Incorrect Answer! The actual answer is \(viewModel.correctAns)")
                            .foregroundColor(.red)
                        
                    }
                }
            }.padding()
            Spacer()
            Text("\(viewModel.points)").font(.system(size: 60)).fontWeight(.bold)
            Spacer()
            Text("Instructions").font(.system(size: viewModel.fontSize))
            Text("Submit the correct answer and gain 1 point. Submit a wrong answer or press on \"NEXT\" and you will lose 1 point.").font(.system(size: viewModel.fontSize))
            Spacer()
            Button(action:{
                viewModel.handleSubmit(answer: viewModel.answer)
                viewModel.generateRandomNumbers()
            }) {
                Text("NEXT")
            }.buttonStyle(.borderedProminent).accentColor( Color.green.opacity(0.2)).foregroundColor(
                .green
            )
            Spacer()
            
        }.frame(maxHeight: .infinity, alignment: .topLeading)
        .padding()
    }
}

#Preview {
    //    GuessView()
    ContentView()
}
