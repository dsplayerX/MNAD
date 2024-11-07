//
//  TaskInputView.swift
//  TodoApp
//
//  Created by Dumindu Sameendra on 2024-10-02.
//

import SwiftUI

public struct TaskInputView: View {
    @Binding var userInput: String
    @Binding var taskArray: [String]
    @Binding var count: Int
    
    public var body: some View {

        TextField("Enter a task", text: $userInput).textFieldStyle(.roundedBorder)
        
        Button("Add Task") {
            if !userInput.isEmpty {
                taskArray.append(userInput)
                count += 1
                userInput.removeAll()
                print("Task Added: \(userInput)")
            }
            print("Tasks: \(taskArray)")
            }.tint(.green).buttonStyle(BorderedProminentButtonStyle())
                .shadow(radius: 5).padding(20)
    
    }
}
