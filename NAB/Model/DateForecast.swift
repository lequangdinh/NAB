//
//  DateForecast.swift
//  EvaluationTest
//
//  Created by Inglab on 08/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import Foundation

class WeatherForecastResponse: Decodable {
    let cnt: Int
    let cod: String
    let message: Double
    let city: City
    let list: [DateForecast]
}

class DateForecast: Decodable {
    let dt: Int
    let pressure: Int
    let humidity: Int
    let temp: Temperature
    let weather: [Weather]
}

