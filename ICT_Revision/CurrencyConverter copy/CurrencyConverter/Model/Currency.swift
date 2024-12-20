//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Dumindu Sameendra on 2024-12-06.
//
import Foundation

enum Currency: String, CaseIterable {
    case usd = "USD"
    case gpb = "GBP"
    case aud = "AUD"
    case cad = "CAD"
    case euro = "EUR"
    
    func getRate() -> Double {
        switch self {
        case .usd: return 308.81
        case .gpb: return 390.31
        case .aud: return 204.40
        case .cad: return 232.82
        case .euro: return 334.92
        }
    }
}
