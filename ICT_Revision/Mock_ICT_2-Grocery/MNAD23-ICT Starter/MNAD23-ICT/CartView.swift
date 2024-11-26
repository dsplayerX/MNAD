//
//  CartView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct CartView: View {
    
    // declare your properties here
    @State var total: Double = 0.0
    @AppStorage("lastTotal") var lastTotal: Double = 0.0
    @Binding var cart: [ShopItem]
    
    var body: some View {
        NavigationStack {
                    VStack {
                        // Display empty cart message
                        if total == 0.0 {
                            Section {
                                Text("Your Cart is Empty")
                                    .foregroundColor(.gray)
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                      
                           
                            } else {
                                List {
                                // Display Purchased Items
                                Section(header: Text("Purchased Items").foregroundColor(.gray)) {
                                    ForEach(cart.filter { $0.quantity > 0 }) { item in
                                        HStack {
                                            Text("\(item.name)")
                                            Spacer()
                                            Text("\(calculatePurchasedItems(item: item), specifier: "%.2f")")
                                        }
                                    }
                                }
                                
                                // Display Payment Details
                                Section(header: Text("Payment Details").foregroundColor(.gray)) {
                                    HStack {
                                        Text("Total")
                                        Spacer()
                                        Text("\(total, specifier: "%.2f")")
                                    }
                                }
                            }.listStyle(.inset)
                                    .cornerRadius(10)
                        }
                        

                        
                        // Previous deal message
                        Spacer()
                        Text("Your previous deal with us was $\(lastTotal, specifier: "%.2f")")
                            .padding([.bottom, .top], 20)
                            .padding(.horizontal, 10)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
        .onAppear {
            calculateTotal()
            print(lastTotal)
        }
        .onDisappear {
            lastTotal = total
            total = 0.0
        }.navigationTitle("My Cart")
    }
    
    private func calculatePurchasedItems(item: ShopItem) -> Double {
        // calculate price for each purchase item
        // price = item price X item quantity
        let price = item.price * Double(item.quantity)
        return price
    }
    
    private func calculateTotal() {
        // calculate total bill value
        // total bill = each item price X each item quantity
        // hint: you need to calculate a new bill every time a user lands on this page;
        // this might be useful to decide when to display the 'Empty Cart' text.
        total = cart.reduce(0.0) { $0 + calculatePurchasedItems(item: $1) }
    }
}

#Preview {
    CartView(cart :.constant([ShopItem(name: "Apple", price: 1.99, quantity: 2), ShopItem(name: "Banana", price: 0.99, quantity: 3)]))
//    ContentView()
}
