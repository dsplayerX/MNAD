//
//  ContentView.swift
//  Pythagoras
//
//  Created by Dumindu Sameendra on 2024-12-06.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("storedBase") var storedBase: String = ""
    @AppStorage("storedAltitude") var storedAltitude: String = ""
    @AppStorage("storedHypotenuse") var storedHypotenuse: String = ""
    @AppStorage("storedArea") var storedArea: String = ""
    @AppStorage("storedPerimeter") var storedPerimeter: String = ""
    
    var body: some View {
        TabView {
            CalculateView(
                storedBase: $storedBase,
                storedAltitude: $storedAltitude,
                storedHypotenuse: $storedHypotenuse,
                storedArea: $storedArea,
                storedPerimeter: $storedPerimeter
            )
            .tabItem { Label("Calculate", systemImage: "sum") }
            HistoryView(
                storedBase: $storedBase,
                storedAltitude: $storedAltitude,
                storedHypotenuse: $storedHypotenuse,
                storedArea: $storedArea,
                storedPerimeter: $storedPerimeter
            )
            .tabItem { Label("History", systemImage: "list.bullet") }
        }
    }
}

struct CalculateView: View {
    
    enum Edges: String, CaseIterable{
        case base = "Base"
        case altitude = "Altitude"
        case hypotenuse = "Hypotenuse"
    }
    
    @State var selectedEdge: Edges = .base

    @State var base: String = ""
    @State var altitude: String = ""
    @State var hypotenuse: String = ""
    @State var result: String = ""
    @State var area: String = ""
    @State var perimeter: String = ""
    
    @Binding var storedBase: String
    @Binding var storedAltitude: String
    @Binding var storedHypotenuse: String
    @Binding var storedArea: String
    @Binding var storedPerimeter: String
    
    @State var showAlert: Bool = false

    var body: some View {
        NavigationStack{
            VStack {
                Image("triangle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                VStack (alignment:.leading){
                    HStack {
                        Text("Choose the unknown edge").frame(maxWidth: 200)
                        Picker("Choose the unknown edge", selection: $selectedEdge){
                            ForEach(Edges.allCases, id: \.self) { edge in
                                Text(edge.rawValue)
                            }
                        }.onChange(of: selectedEdge){ newValue in
                            resetAllFields()
                        }
                    }
                    Spacer()
                    Text("Enter known length values")
                    if selectedEdge == .base{
                        TextField("Altitude", text: $altitude)
                        TextField("Hypotenuse", text: $hypotenuse)
                    } else if selectedEdge == .altitude {
                        TextField("Base", text: $base)
                        TextField("Hypotenuse", text: $hypotenuse)
                    } else {
                        TextField("Base", text: $base)
                        TextField("Altitude", text: $altitude)
                    }
                }.padding()
                Spacer()
                Button{
                    if selectedEdge == .base {
                        if hypotenuse == "" || altitude == "" {
                            showAlert = true
                            return
                        }
                    } else if selectedEdge == .altitude {
                        if base == "" || hypotenuse == "" {
                            showAlert = true
                            return
                        }
                    } else {
                        if base == "" || altitude == "" {
                            showAlert = true
                            return
                        }
                    }
                    calculate()
//                    resetAllFields()
                } label: {
                    Text("Calculate")
                }.buttonStyle(.borderedProminent).tint(.green).alert(
                    ("Fill all fields"),
                    isPresented: $showAlert){}
                Spacer()
                Text("\(selectedEdge.rawValue): \(result)")
                Text("Area: \(area)")
                Text("Perimeter: \(perimeter)")
                Spacer()
            }
            
            .navigationTitle("Triangle Calculator")
        }
    }
    
    func calculate(){
        if selectedEdge == .base {
            let hypotenuseInt = Double(hypotenuse)!
            let altitudeInt = Double(altitude)!
            let baseInt: Double
            let a = hypotenuseInt * hypotenuseInt - altitudeInt * altitudeInt
            print(a)
            let resultInt = sqrt(a)
            baseInt = resultInt
            let areaInt = baseInt * altitudeInt / 2
            let perimeterInt = baseInt + altitudeInt + hypotenuseInt
            result = String(format: "%.2f", resultInt)
            area = String(format: "%.2f", areaInt)
            perimeter = String(format: "%.2f", perimeterInt)
        } else if selectedEdge == .altitude {
            let baseInt = Double(base)!
            let hypotenuseInt = Double(hypotenuse)!
            let altitudeInt: Double
            let a = hypotenuseInt * hypotenuseInt - baseInt * baseInt
            print(a)
            let resultInt = sqrt(a)
            altitudeInt = resultInt
            let areaInt = baseInt * altitudeInt / 2
            let perimeterInt = baseInt + hypotenuseInt + altitudeInt
            result = String(format: "%.2f", resultInt)
            area = String(format: "%.2f", areaInt)
            perimeter = String(format: "%.2f", perimeterInt)
        } else {
            let baseInt = Double(base)!
            let altitudeInt = Double(altitude)!
            let hypotenuseInt: Double
            let a = baseInt * baseInt + altitudeInt * altitudeInt
            print(a)
            let resultInt = sqrt(a)
            hypotenuseInt = resultInt
            let areaInt = baseInt * altitudeInt / 2
            let perimeterInt = baseInt + hypotenuseInt + altitudeInt
            result = String(format: "%.2f", resultInt)
            area = String(format: "%.2f", areaInt)
            perimeter = String(format: "%.2f", perimeterInt)
        }
        
        storedBase = base
        storedAltitude = altitude
        storedHypotenuse = hypotenuse
        storedArea = area
        storedPerimeter = perimeter
        
    }
    
    func resetAllFields() {
        base = ""
        altitude = ""
        hypotenuse = ""
        area = ""
        perimeter = ""
        result = ""
    }
}

struct HistoryView: View {
    @Binding var storedBase: String
    @Binding var storedAltitude: String
    @Binding var storedHypotenuse: String
    @Binding var storedArea: String
    @Binding var storedPerimeter: String
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Text("Base")
                    Spacer()
                    Text("\(storedBase)")
                }
                HStack{
                    Text("Altitude")
                    Spacer()
                    Text("\(storedAltitude)")
                }
                HStack{
                    Text("Hypotenuse")
                    Spacer()
                    Text("\(storedHypotenuse)")
                }
                HStack{
                    Text("Area")
                    Spacer()
                    Text("\(storedArea)")
                }
                HStack{
                    Text("Perimeter")
                    Spacer()
                    Text("\(storedPerimeter)")
                }
            }.padding()
            Spacer()
            .navigationTitle("Last Calculation")
        }.padding()
    }
}

#Preview {
    ContentView()
}
