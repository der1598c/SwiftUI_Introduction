//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by cata on 8/11/19.
//  Copyright © 2019 cata. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedItem: String = ""
    @ObservedObject var tipVM = TipViewModel()
    
    var body: some View {
        Group {
            VStack {
                TextField("Enter total amount", text: self.$tipVM.total)
                Text("\(self.tipVM.tip)")
                
                Picker(selection: $selectedItem, label: Text("Chose Item")) {
                    Text("Option 1")
                    Text("Option 2")
                    Text("Option 3")
                }.pickerStyle(SegmentedPickerStyle())
                
                Button("Submit") {
                    self.tipVM.calculateTip()
                }
            }
        }.padding()
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
