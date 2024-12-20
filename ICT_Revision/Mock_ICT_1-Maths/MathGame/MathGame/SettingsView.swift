//
//  SettingsView.swift
//  MathGame
//
//  Created by Dumindu Sameendra on 2024-11-26.
//

import SwiftUI

enum AppTheme : String, CaseIterable {
    case blue = "Blue"
    case red = "Red"
    case orange = "Orange"
    case green = "Green"
    
    var color: Color {
        switch self {
        case .blue: return .blue
        case .red: return .red
        case .orange: return .orange
        case .green: return .green
        }
    }
}

struct SettingsView: View {
    
    
//    @Binding var selectedColor: Color
//    
//    @Binding var fontSize : CGFloat
//    
//
    
    @ObservedObject var viewModel: ViewModel
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(viewModel.selectedColor).padding()
                Spacer()
                VStack (alignment: .leading){
                    Text("Font Size \(viewModel.fontSize, specifier: "%0.1f")px")
                    Slider(value: $viewModel.fontSize, in: 0...32, step: 0.5)
                        .accentColor(viewModel.selectedColor)
                }.padding()

                HStack{
                    Text("System Color")
                    Picker("", selection: $viewModel.selectedTheme) {
                        ForEach(AppTheme.allCases, id: \.self) { theme in
                            Text(theme.rawValue).tag(theme.color)
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    Color(viewModel.selectedColor)
                        .frame(width: 30, height: 30)
                }.padding()
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.resetScore()
                        showAlert = true
                    }) {
                        Text("Reset Score")
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Score Reset"),
                            message: Text("Your score has been reset to 0"),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    Spacer()
                }
            }.padding()
        }
    }
}


#Preview {
        SettingsView(viewModel: ViewModel())
  
}
