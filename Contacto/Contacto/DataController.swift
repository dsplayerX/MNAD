//
//  DataController.swift
//  Contacto
//
//  Created by Dumindu Sameendra on 2024-11-06.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ContactDataModel")
    
    init () {
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Something went wrong with loading database: \(error.localizedDescription)")
            }
        }
    }
    
}
