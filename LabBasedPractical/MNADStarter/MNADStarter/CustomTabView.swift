//
//  CustomTabView.swift
//  MNADStarter
//
//  Created by Visal Rajapakse on 2023-06-30.
//

import SwiftUI

struct CustomTabView: View {
    
//    @State var selectedCurrency = Currencies.usd.rawValue
    @AppStorage("selectedCurrency") var selectedCurrency = Currencies.usd.rawValue
    
    var body: some View {
                TabView {
                    NavigationView {
                        HomeView(selectedCurrency: $selectedCurrency)
                            .navigationTitle("Currency Converter")
                    }.tabItem {
                        Label("Home", systemImage: "house")
                    }
                   

                    NavigationView {
                        SettingsView(selectedCurrency: $selectedCurrency)
                            .navigationTitle("Settings")
                    }
                    .tabItem {
                            Label("Settings", systemImage: "gearshape")
                    }
                }
            }
        }

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
