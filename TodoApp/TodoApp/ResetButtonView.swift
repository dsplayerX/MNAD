//
//  CounterResetButtonView.swift
//  TodoApp
//
//  Created by Dumindu Sameendra on 2024-10-02.
//

import SwiftUI

public struct ResetButtonView: View {
    @Binding var count: Int
    @Binding var bgColor: Color
    @Binding var textColor: Color
    @Binding var taskArray: [String]
    
    public var body: some View {
        Button("Reset") {
            count = 0
            bgColor = .clear
            textColor = .black
            taskArray.removeAll()
        }.tint(.gray).buttonStyle(BorderedProminentButtonStyle()).shadow(radius: 5)
    }
}
