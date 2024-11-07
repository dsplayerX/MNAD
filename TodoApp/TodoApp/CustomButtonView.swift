//
//  CustomButtonView.swift
//  TodoApp
//
//  Created by Dumindu Sameendra on 2024-10-02.
//

import SwiftUI

struct CustomButtonView: View {
    @Binding var bgColor: Color
    
    var body: some View {
        Button("Party Mode") {
            
            bgColor = randomColor()
            
        }.tint(.purple).buttonStyle(BorderedProminentButtonStyle()).shadow(radius: 5)
    }
    
    private func randomColor() -> Color {
            let red = Double.random(in: 0...1)
            let green = Double.random(in: 0...1)
            let blue = Double.random(in: 0...1)
            return Color(red: red, green: green, blue: blue)
    }
}
