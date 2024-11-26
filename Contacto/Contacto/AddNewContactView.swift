import SwiftUI

struct AddNewContactView: View {
    @Binding var displaySheet: Bool
    @State private var name: String = ""
    @State private var mobile: String = ""

    @Environment(\.managedObjectContext) var managedObjectContext

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Contact Details")) {
                    TextField("Name", text: $name)
                    TextField("Mobile", text: $mobile)
                        .keyboardType(.phonePad)
                }
            }
            .navigationTitle("Add New Contact")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        displaySheet = false
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        let newContact = ContactEntity(context: managedObjectContext)
                        newContact.name = name
                        newContact.mobile = mobile

                        do {
                            try managedObjectContext.save()
                            displaySheet = false
                        } catch {
                            print("Error saving contact: \(error.localizedDescription)")
                        }
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                Button(action: {
                    name = ""
                    mobile = ""
                }) {
                    Text("Reset Fields")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.7))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
        }
    }
}
