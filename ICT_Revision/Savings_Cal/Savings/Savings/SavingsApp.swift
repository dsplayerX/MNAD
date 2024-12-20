//
//  SavingsApp.swift
//  Savings
//
//  Created by Philip Trwoga on 14/10/2024.
//

import SwiftUI
import SwiftData

@main
struct SavingsApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(for: SavingsModel.self)
    }
}
