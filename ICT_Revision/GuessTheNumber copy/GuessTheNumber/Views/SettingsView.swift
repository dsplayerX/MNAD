//
//  SettingsView.swift
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
struct SettingsView: View {
    @Binding var fontSize: CGFloat
    @Binding var systemColor: ColorsEnum
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Font size (\(fontSize, specifier: "%.1f")px)")
                Slider(value: $fontSize, in: 8...24, step: 0.5).tint(systemColor.getColor)
                
                HStack {
                    Text("System Color")
                    Picker("System Color", selection: $systemColor) {
                        ForEach(ColorsEnum.allCases, id: \.self) { color in
                            Text(color.rawValue)
                        }
                    }.tint(systemColor.getColor).pickerStyle(.wheel)
                    Color(systemColor.getColor).frame(width: 30, height: 30)
                }
                Spacer()
            }.padding()
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(fontSize: .constant(12), systemColor: .constant(ColorsEnum.red))
}
