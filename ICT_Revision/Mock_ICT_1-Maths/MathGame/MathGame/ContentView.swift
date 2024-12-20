//
//  ContentView.swift
//  MathGame
//
//  Created by Dumindu Sameendra on 2024-11-26.
//

import SwiftUI


struct ContentView: View {
    
//    @State var selectedColor: Color = AppTheme.blue.color
//    @State var fontSize : CGFloat = 16
 
    @StateObject var viewModel = ViewModel()  
    
    var body: some View {
        TabView{
            GuessView(viewModel: viewModel) .tabItem{
                Label("Guess", systemImage: "checkmark.seal.fill")
            }
            SettingsView(viewModel: viewModel).tabItem{
                Label("Settings", systemImage: "gear")
            }
        }.accentColor(viewModel.selectedColor)
    }
    
}

#Preview {
    ContentView()
}
