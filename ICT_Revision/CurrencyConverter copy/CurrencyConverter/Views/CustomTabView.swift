//
//  CustomTabView.swift
//  CurrencyConverter
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

struct CustomTabView: View {
    @AppStorage("defaultCurrency") var defaultCurrency: Currency = .usd

    var body: some View {
        TabView {
            HomeView(defaultCurrency: $defaultCurrency).tabItem { Label("Home", systemImage: "house") }
            SettingsView(defaultCurrency: $defaultCurrency)
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
    }
}

#Preview {
    CustomTabView()
}
