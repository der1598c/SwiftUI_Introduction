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
        NavigationView {
            
            VStack(alignment: .center) {
                        
                        TextField("Enter city name", text: self.$weatherVM.cityName) {
                            self.weatherVM.search()
                        }.font(.custom("Arial", size: 50))
                            .padding()
                            .fixedSize()
                            .cornerRadius(16)
                        
                        HStack() {
                            
                            Text(self.weatherVM.temperature != "" ? self.weatherVM.temperature : !self.isCelsius ? "0ºF" : "0ºC")
                                .font(.custom("Arial", size: 50))
                                .foregroundColor(Color.white)
            //                    .offset(y: 100)
                                .padding()
                                .background(!self.isCelsius ? Color.blue : Color.orange)
                                .cornerRadius(16)
                            
                            Text(self.weatherVM.humidity != "" ? self.weatherVM.humidity : "0%")
                                .font(.custom("Arial", size: 50))
                                .foregroundColor(Color.white)
            //                    .offset(y: 100)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(16)
                            
                        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 120)
                        
                        ChangeUnitsButton(weatherVM: self.weatherVM, isCelsius: $isCelsius)
                        .padding()
                        .scaledToFit()
                        
                    }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .background(Color.green)
                        .edgesIgnoringSafeArea(.all)
                
            .navigationBarTitle(Text("Finding Weather"))
        }
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
            Text(self.isCelsius ? "Show ºF" : "Show ºC")
        }.padding(12)
        .background(Color.yellow)
        .cornerRadius(16)
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
