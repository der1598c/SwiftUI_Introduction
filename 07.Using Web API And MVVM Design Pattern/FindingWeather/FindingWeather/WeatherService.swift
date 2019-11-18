//
//  WeatherService.swift
//  FindingWeather
//
//  Created by Leyee.H on 2019/11/18.
//  Copyright © 2019 Leyee. All rights reserved.
//

import Foundation

class WeatherService {
    
    //https://openweathermap.org/
    let appId: String = "b425d5ebddab51a95ab4af652f2b86e9"
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(appId)&units=imperial") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            if let weatherResponse = weatherResponse {
                let weather = weatherResponse.main
                completion(weather)
            } else {
                completion(nil)
            }
        }.resume()
        
    }
    
}
