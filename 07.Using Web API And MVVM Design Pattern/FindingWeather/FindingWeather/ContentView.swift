//
//  ContentView.swift
//  FindingWeather
//
//  Created by Leyee.H on 2019/11/18.
//  Copyright © 2019 Leyee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    @State private var isCelsius = false
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            
            TextField("Enter city name", text: self.$weatherVM.cityName) {
                self.weatherVM.search()
            }.font(.custom("Arial", size: 50))
                .padding()
                .fixedSize()
            
            ChangeUnitsButton(weatherVM: self.weatherVM, isCelsius: $isCelsius)
            
            HStack() {
                
//                self.weatherVM.isCelsius = self.$isCelsius
                
                Text(self.isCelsius ? self.weatherVM.temperature : self.weatherVM.temperature)
                    .font(.custom("Arial", size: 50))
                    .foregroundColor(Color.white)
                    .offset(y: 100)
                    .padding()
                Text(self.weatherVM.humidity)
                    .font(.custom("Arial", size: 50))
                    .foregroundColor(Color.white)
                    .offset(y: 100)
                    .padding()
            }
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ChangeUnitsButton: View {
    
    var weatherVM: WeatherViewModel
    @Binding var isCelsius: Bool
    
    var body: some View {
        
        Button(action: {
            self.isCelsius.toggle()
            self.weatherVM.isCelsius = self.isCelsius
        }) {
            Text("Change units")
        }.padding(12)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
