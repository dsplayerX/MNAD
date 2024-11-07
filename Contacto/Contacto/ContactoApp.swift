//
//  ContactoApp.swift
//  Contacto
//
//  Created by Dumindu Sameendra on 2024-11-06.
//

import SwiftUI

@main
struct ContactoApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
