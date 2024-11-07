//
//  MeowaApp.swift
//  Meowa
//
//  Created by Dumindu Sameendra on 2024-10-23.
//

import SwiftUI

@main
struct MeowaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(catViewModel: CatViewModel())
        }
    }
}
