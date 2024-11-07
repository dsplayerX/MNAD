//
//  ContentView.swift
//  TodoApp
//
//  Created by Dumindu Sameendra on 2024-10-02.
//

import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    @State public var bgColor: Color = .clear
    @State public var textColor: Color = .black
    @State public var userInput: String = ""
    @State private var taskArray: [String] = []
    
    var body: some View {
        ZStack {
            Color(bgColor).ignoresSafeArea()
            
            VStack {
                Text("Todo App").font(.largeTitle)
                    .foregroundStyle(textColor)
                Text("Task Count: \(count)").foregroundStyle(textColor).padding(10)
               
                List {
                    ForEach(taskArray, id: \.self) { task in
                        HStack {
                            Text(task)
                            Spacer()
                            Button(action: {
                                if let index = taskArray.firstIndex(of: task) {
                                    taskArray.remove(at: index)
                                    count -= 1
                                }
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }.cornerRadius(5).frame(maxHeight:600)
                TaskInputView(userInput: $userInput, taskArray: $taskArray, count: $count)
                
                
//                HStack{
//                    Button("Increment") {
//                        count += 1
//                        bgColor = .green
//                        print("Incremented. New count: \(count)")
//                    }.tint(.green).buttonStyle(BorderedProminentButtonStyle())
//                        .shadow(radius: 5).padding(20)
//                    Button("Decrement") {
//                        count -= 1
//                        bgColor = .red
//                        print("Decremented. New count: \(count)")
//                    }.tint(.red).buttonStyle(BorderedProminentButtonStyle()).shadow(radius: 5).padding(20)
//                }.padding()
                
                ResetButtonView(count: $count, bgColor: $bgColor, textColor: $textColor, taskArray: $taskArray)
                
                CustomButtonView(bgColor: $bgColor).padding()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
