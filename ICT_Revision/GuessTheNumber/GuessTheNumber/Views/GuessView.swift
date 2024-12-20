//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

struct GuessView: View {
    @ObservedObject var viewModel: GuessVM
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Text("Guess the answer!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(viewModel.systemColor.getColor)
                .padding(20)
            
            Text("What is \(viewModel.number1) \(viewModel.op.rawValue) \(viewModel.number2)?")
                .font(.title).bold()
            HStack {
                TextField("Answer", text: $viewModel.answer)
                    .textFieldStyle(.plain)
                    .keyboardType(.numbersAndPunctuation)
                    .onChange(of: viewModel.answer){
                        oldVlaue, newValue in
                        viewModel.answer = filterInput(newValue)
                    }
                Button("Submit") {
                    viewModel.alreadyAnswered = true
                    viewModel.checkAnswer()
                }.disabled(viewModel.alreadyAnswered).buttonStyle(.bordered).tint(.blue)
            }.padding(20).border(colorScheme == .dark ? Color.white : Color.black)
            
            if viewModel.alreadyAnswered {
                if viewModel.answer == String(viewModel.result) {
                    Label("CORRECT ANSWER! WELL DONE", systemImage: "checkmark.circle.fill").foregroundColor(Color.green)
                } else {
                    Label("Incorrect Answer! Actual Answer is \(viewModel.result).", systemImage: "xmark.circle.fill").foregroundColor(Color.red)
                }
            }
            Spacer()
            
            Text("\(viewModel.score)").font(.system(size: 72)).bold()
            Spacer()
            VStack{
                Text("Instructions").padding()
                Text("Submit the correct ansawer and gain 1 point. Submit a wrong answer or press \"NEXT\" and you will lose 1 point.")
            }.font(.system(size: viewModel.fontSize))
            Spacer()
            Button("Next Question") {
                if !viewModel.alreadyAnswered {
                    viewModel.checkAnswer()
                }
                viewModel.generateQuestion()
                viewModel.validateResult()
            }.buttonStyle(.bordered).tint(Color.green)
        }
        .padding()
        .onAppear {
            viewModel.generateQuestion()
            viewModel.validateResult()
        }
    }
    
    func filterInput(_ input: String) -> String {
        let allowedCharacters = "0123456789-."
        let filteredInput = input.filter { allowedCharacters.contains($0) }
        
        // Ensure there's only one leading negative sign
        if filteredInput.hasPrefix("-"), filteredInput.dropFirst().contains("-") {
            return String(filteredInput.filter { $0 != "-" }) // Remove extra "-"
        }
        
        // Ensure there's only one decimal point
        if filteredInput.components(separatedBy: ".").count > 2 {
            return String(filteredInput.dropLast()) // Remove extra "."
        }
        
        return filteredInput
    }
}

#Preview {
    CustomTabView()
    //    GuessView(fontSize: .constant(12), systemColor: .constant(ColorsEnum.red))
}
