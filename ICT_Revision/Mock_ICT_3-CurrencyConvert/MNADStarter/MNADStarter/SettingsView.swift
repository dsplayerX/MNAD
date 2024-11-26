//
//  SettingsView.swift
//  MNADStarter
//
//  Created by Visal Rajapakse on 2023-06-30.
//

import SwiftUI

enum Currencies: String, CaseIterable {
    case usd = "USD"
    case gbp = "GBP"
    // Add the rest of the currencies here
}

struct SettingsView: View {
    
    var body: some View {
        Text("Add settings page content here")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
