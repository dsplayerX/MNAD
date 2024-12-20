//
//  CustomTabView.swift
//  GuessTheNumber
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

struct CustomTabView: View {
    @StateObject var viewModel = GuessVM()
    var body: some View {
        TabView {
            GuessView(viewModel: viewModel)
                .tabItem { Label("Guess", systemImage: "checkmark.circle.badge.questionmark.fill")
                }
            
            SettingsView(viewModel: viewModel)
                .tabItem {
                    Label("Settings", systemImage: "gear.circle.fill")
                }
        }.accentColor(viewModel.systemColor.getColor)
    }
}

#Preview {
    CustomTabView()
}
