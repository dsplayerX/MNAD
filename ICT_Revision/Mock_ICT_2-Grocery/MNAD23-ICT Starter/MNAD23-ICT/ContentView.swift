//
//  ContentView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct ContentView: View {
    
    // declare your properties here
    @State var shopItems = [
        ShopItem(name: "Broccoli", price: 5.00, quantity: 0),
        ShopItem(name: "Banana", price: 10.00, quantity: 0),
        ShopItem(name: "Avocado", price: 7.00, quantity: 0),
        ShopItem(name: "Chicken", price: 20.00, quantity: 0),
        ShopItem(name: "Water", price: 5.00, quantity: 0)
    ]
    
    @State var showCartView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Buy Fresh Groceries").font(.largeTitle).fontWeight(.bold)
                Divider()
                ForEach($shopItems) { $shopItem in
                    HStack {
                        Image(shopItem.name.lowercased())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading) {
                            Text("\(shopItem.name)")
                            Text("$\(shopItem.price, specifier: "%.2f")")
                        }
                        Stepper(value: $shopItem.quantity, in: 0...10) {
                        }
                        Text("\(shopItem.quantity)")
                            .frame(width: 40, alignment: .center)
                    }
                    Divider()
                }
            }
            
            Spacer()
            
            Button("Checkout") {
                showCartView.toggle()
                //print(showCartView)
            }.buttonStyle(.bordered)
//                .navigationTitle("Buy Fresh Groceries")
                .navigationDestination(isPresented: $showCartView) {
                    CartView(cart: $shopItems)
                }
        }.padding()
        

    }
}

#Preview {
    ContentView()
}
