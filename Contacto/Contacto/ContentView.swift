//
//  ContentView.swift
//  Contacto
//
//  Created by Dumindu Sameendra on 2024-11-06.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var  managedObjectContext
    @FetchRequest(sortDescriptors: []) var contacts: FetchedResults<ContactEntity>
    
    @State var displaySheet = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    HStack{
                        VStack(alignment: .leading) {
                            Text(contact.name ?? "Unknown").bold().font(.title2)
                            Text(contact.mobile ?? "Unknown")
                        }
                        Spacer()
                        Button(action: {
                            managedObjectContext.delete(contact)
                        }, label: {
                            Image(systemName: "trash")
                        })
                    }
                }
                
                
            }
            .navigationTitle("My Contacts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "plus") {
                        displaySheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $displaySheet, content: {
                AddNewContactView(displaySheet: $displaySheet)
            })
        }
    }
}

#Preview {
    ContentView()
}

