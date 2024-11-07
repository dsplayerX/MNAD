//
//  ContentView.swift
//  IntroductionApp
//
//  Created by Dumindu Sameendra on 2024-09-25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center) {
                Spacer()
                Circle().frame(width: 150).foregroundStyle(.red).padding(10)
                Rectangle().frame(width: 200, height: 75).foregroundStyle(.black).padding(10)
                ScrollView(.horizontal) {
                    HStack{
                        Rectangle().frame(width: 150, height: 150).foregroundStyle(.black)
                        Rectangle().frame(width: 150, height: 150).foregroundStyle(.black)
                        Rectangle().frame(width: 150, height: 150).foregroundStyle(.black)
          
                    }.padding(30)
                }
                Spacer()
                Rectangle().frame(width: 300, height: 100).foregroundStyle(.red)
                Rectangle().frame(width: 300, height: 100).foregroundStyle(.red)
                Rectangle().frame(width: 300, height: 100).foregroundStyle(.red)
                Rectangle().frame(width: 300, height: 100).foregroundStyle(.red)
                Rectangle().frame(width: 300, height: 100).foregroundStyle(.red)
                Spacer()
            }
            .padding(30)
        }
    }
}

#Preview {
    ContentView()
}
