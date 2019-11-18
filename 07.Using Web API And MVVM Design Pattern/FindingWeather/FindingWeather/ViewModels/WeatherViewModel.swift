//
//  WeatherViewModel.swift
//  FindingWeather
//
//  Created by Leyee.H on 2019/11/18.
//  Copyright © 2019 Leyee. All rights reserved.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    private var weatherService: WeatherService!
    
    @Published var weather = Weather()
    
    var isCelsius = false
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            var formated = ""
            if(isCelsius) {
                formated = String(format: "%.0f", temp.convertToCelsius())
                return String("\(formated)ºC")
            } else {
                formated = String(format: "%.0f", temp)
                return String("\(formated)ºF")
            }
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.weather.humidity {
            return String("\(String(format: "%.0f", humidity))%")
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        
        self.weatherService.getWeather(city: city) { weather in
            
            if let weather = weather {
                DispatchQueue.main.async {
                    self.weather = weather
                }
            }
            
        }
    }
    
}

extension Double {
    func convertToCelsius() -> Double {
        return (self - 32) * 5/9
    }
}
