//
//  AddNewContactView.swift
//  Contacto
//
//  Created by Dumindu Sameendra on 2024-11-06.
//

import SwiftUI

struct AddNewContactView: View {
    @State var name: String = ""
    @State var mobile: String = ""
    @Binding var displaySheet: Bool
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var  managedObjectContext
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    TextField("Name", text: $name)
                    TextField("Mobile", text: $mobile)
                }
            }
            .navigationTitle("Add New Contact").font(.headline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newContact = ContactEntity(context: managedObjectContext)
                        newContact.name = name
                        newContact.mobile = mobile
                        
                        try? managedObjectContext.save()
                        dismiss()
                        
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                        
                    }.tint(.red)
                }
            }
        }
    }
}

#Preview {
    AddNewContactView(displaySheet: .constant(true))
}
