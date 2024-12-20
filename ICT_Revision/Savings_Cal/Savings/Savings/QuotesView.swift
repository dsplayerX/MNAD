//
//  ContentView.swift
//  Mortgage
//
//  Created by Philip Trwoga on 14/10/2024.
//

import SwiftUI
import SwiftData

struct QuotesView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var quotes: [SavingsModel]
    
    var body: some View {
        VStack{
            Text("Quotes List")
            //your List here
            //List(quotes){quote in ...
            List(quotes){quote in
                VStack(alignment: .leading){
                    Label{
                        HStack{
                            Text("Future Value ")
                            Text("\(quote.futureValue)").bold()
                        }
                    } icon:{
                        Image(systemName: "banknote")
                    }
                    Label("Initial Amount £\(quote.initialAmount)", systemImage: "sterlingsign")
                    Label("Interest \(quote.interest)%", systemImage: "percent")
                    Label("Period \(quote.period) years", systemImage: "calendar")
                    Label(
                        "Monthly Contribution £\(quote.monthlyContribution)",
                        systemImage: "sterlingsign"
                    )
                }
            }
        }
    }
}


                #Preview {
                    MainTabView()
                }
        
    

