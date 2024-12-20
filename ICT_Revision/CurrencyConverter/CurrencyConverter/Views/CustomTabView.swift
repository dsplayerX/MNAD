//
//  CustomTabView.swift
//  CurrencyConverter
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

struct CustomTabView: View {
    @StateObject var viewModel = CurrencyConvertorVM()
    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel).tabItem { Label("Home", systemImage: "house") }
            SettingsView(viewModel: viewModel)
                .tabItem { Label("Settings", systemImage: "gearshape") }
        }
    }
}

#Preview {
    CustomTabView()
}
