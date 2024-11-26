//
//  ShopItem.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import Foundation

class ShopItem : Identifiable{
    var id: UUID = UUID()
    // name: stores grocery item name,
    // hint: lowercased version of this value can be used access the relavent asset
    var name: String
    
    // price: stores grocery item price
    var price: Double
    
    // quantity: stores how many items user wants purchase
    var quantity: Int
    
    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
}
