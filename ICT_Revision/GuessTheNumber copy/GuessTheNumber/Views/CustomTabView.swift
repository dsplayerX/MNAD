//
//  CustomTabView.swift
//  GuessTheNumber
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

struct CustomTabView: View {
    @State var fontSize: CGFloat = 12
    @State var systemColor: ColorsEnum = .blue
    
    var body: some View {
        TabView {
            GuessView(fontSize: $fontSize, systemColor: $systemColor)
                .tabItem { Label("Guess", systemImage: "checkmark.circle.badge.questionmark.fill")
                }
            
            SettingsView(fontSize: $fontSize, systemColor: $systemColor)
                .tabItem {
                    Label("Settings", systemImage: "gear.circle.fill")
                }
        }.accentColor(systemColor.getColor)
    }
}

#Preview {
    CustomTabView()
}
