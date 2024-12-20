//
//  SettingsView.swift
//  GuessTheNumber
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: GuessVM
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Font size (\(viewModel.fontSize, specifier: "%.1f")px)")
                Slider(value: $viewModel.fontSize, in: 8...24, step: 0.5).tint(viewModel.systemColor.getColor)
                
                HStack {
                    Text("System Color")
                    Picker("System Color", selection: $viewModel.systemColor) {
                        ForEach(ColorsEnum.allCases, id: \.self) { color in
                            Text(color.rawValue)
                        }
                    }.tint(viewModel.systemColor.getColor).pickerStyle(.wheel)
                    Color(viewModel.systemColor.getColor).frame(width: 30, height: 30)
                }
                Spacer()
            }.padding()
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView(viewModel: GuessVM())
}
