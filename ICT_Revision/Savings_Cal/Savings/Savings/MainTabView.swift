//
//  MainTabView.swift
//  Savings
//
//  Created by Philip Trwoga on 14/10/2024.
//

import SwiftUI


struct MainTabView: View {
    var body: some View {
        TabView {
            //first view here
            //.tabItem...
            //second viewhere
            //.tabItem...
            SavingsMainView()
                .tabItem {
                    Label("Savings", systemImage: "sterlingsign")
                }
            QuotesView()
                .tabItem {
                    Label("Quotes", systemImage: "calendar")
                }
        }
    }
}

#Preview {
    MainTabView()
}
