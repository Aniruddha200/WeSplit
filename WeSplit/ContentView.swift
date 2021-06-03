//
//  ContentView.swift
//  WeSplit
//
//  Created by administrator on 07/04/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount = ""
    @State private var totalPeople = 2
    @State private var tipsAmount = 10
    
    func splitCalculator() -> Double{
        let amountBT = Double(billAmount) ?? 0.0
		let tAmount = Double(tipsAmount)
        let amountAT = amountBT * (1+(tAmount/100))
        let cpp = amountAT / Double(totalPeople + 1)
        return cpp
    }
    
    var tips = [0, 10, 20]
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Enter the Bill Amount", text: $billAmount)
                        .keyboardType(.decimalPad)
                }
                    
                    Section(header: Text("People & Tip")){
                        Picker("Select number of people", selection: $totalPeople){
                            ForEach(1..<100){
                                Text("\($0)")
                            }
                        }
                        Section(header: Text("Tip Amount")){
                            Picker("Select tip",selection: $tipsAmount){
                                ForEach(0..<tips.count){
                                    Text("\(tips[$0])")
                                }
                                
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        
                    }
                Section(header: Text("Per Person")){
                    Text(String(format: "%.2f", splitCalculator()))
						.foregroundColor(self.tipsAmount > 0 ? Color.green : Color.red)
                        .bold()
                        .multilineTextAlignment(.center)
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
