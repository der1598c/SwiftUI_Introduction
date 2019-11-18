//
//  Weather.swift
//  FindingWeather
//
//  Created by Leyee.H on 2019/11/18.
//  Copyright © 2019 Leyee. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
