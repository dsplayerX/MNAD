//
//  ContentView.swift
//  Vouchers
//
//  Created by Dumindu Sameendra on 2024-12-05.
//

import SwiftUI

struct ContentView: View {
    // darkmode
    //    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage("colorToggle") var colorToggle: Bool = false
    @State var showAddVoucher: Bool = false
    @State var vouchers: [Voucher] = []
    
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack {
                HStack {
                    Text("Vouchers")
                        .font(.title).fontWeight(.bold)
                    Toggle("", isOn: $colorToggle)
                }
                
                if vouchers.isEmpty {
                    ContentUnavailableView(){
                        Label("No vouchers found", systemImage: "square.and.arrow.down")
                        Text("Add your voucher today!").font(.system(size: 16)).foregroundColor(.secondary)
                    }
                } else {
                    List {
                        ForEach(vouchers, id:\.self) {voucher in
                            VoucherRowView(voucher: voucher, colorToggle:$colorToggle)
                        }
                    }.listStyle(.plain).foregroundColor(colorToggle ? Color.black : Color.white)
                }
                Spacer()
            }
            Button {
                showAddVoucher = true
            } label: {
                Image(systemName: "plus").padding(20).background(Color.blue).foregroundColor(.white).clipShape(.circle)
            }
            .padding(.trailing, 30)
            .padding(.bottom, 20)
        }
        .padding()
        .sheet(isPresented: $showAddVoucher) {
            AddNewVoucherView(vouchers: $vouchers)
        }
    }
}

struct VoucherRowView: View {
    func colorForAmount(amount: Double) -> Color {
        switch amount {
        case 1000.00 : return Color.cyan
        case 2000.00 : return Color.indigo
        case 2500.00 : return Color.mint
        case 5000.00 : return Color.teal
        case 10000.00 : return Color.pink
        default : return Color.gray
        }
    }
    
    
    @State var voucher: Voucher
    @Binding var colorToggle: Bool

    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Text(voucher.title).bold()
                Spacer()
                Text("$\(voucher.amount, specifier: "%.2f")").bold()
            }
            Text(voucher.notes)
        }.padding(10).background(colorForAmount(amount: voucher.amount).opacity(colorToggle ? 0.3 : 1)).cornerRadius(
            10
        )
    }
}


struct AddNewVoucherView: View {
    @Binding var vouchers: [Voucher]
    @Environment(\.dismiss) var dismiss
    
    @State var title: String = ""
    @State var amount: Double = 1000.00
    @State var notes: String = ""
    
    private let prices = [1000.00, 2000.00, 2500.00, 5000.00, 10000.00]
    
    @State var selectedAmount: Double = 0
    
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            Form{
                TextField("Title", text: $title)
                TextField("Notes", text: $notes)
                
                Picker("Amount", selection: $amount) {
                    ForEach(prices, id: \.self ){ price in
                        Text("$\(price, specifier: "%.0f")")
                    }
                }
                .pickerStyle(.navigationLink)
            }
            .navigationTitle("Add Voucher")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .topBarTrailing) {
                    Button("Add") {
                        if title.isEmpty || notes.isEmpty{
                            showAlert = true
                            return
                        }
        
                        vouchers.append(Voucher(
                            title: title,
                            notes: notes, amount: amount
                        ))
                        dismiss()}
                }
                ToolbarItem (placement: .topBarLeading){
                    Button("Dismiss") {
                        dismiss()
                    }.tint(Color.red)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill all the fields"), dismissButton: .default(Text("OK")))
            }
        }
    }
}
#Preview {
    ContentView()
}
