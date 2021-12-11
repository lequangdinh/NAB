//
//  WeatherViewModel.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import UIKit

class WeatherViewModel :ViewModel {
    
    
    // MARK: - Variables
   
    let date: String
    let averageTemperature: String
    let pressure: String
    let humidity: String
    let desc: String
    
    private var unit: Unit = Unit.Default
    
    // MARK: - Closures
    var reloadDataForTableView: (()->())?
    
    
    // MARK: - Inititalization
    required init(weather: DateForecast, unit: Unit) {
        self.date = "Date:   \(DateUtils.convertTimeStampToDate(weather.dt))"
        
        let avarageTemp = (weather.temp.day + weather.temp.night + weather.temp.morn + weather.temp.eve) / 4
        var averageTemperatureText = "Average Tempurature:   \(Int(avarageTemp))"
        switch unit {
        case .Default:
            averageTemperatureText += "°K"
        case .Metric:
            averageTemperatureText += "°C"
        case .Imperial:
            averageTemperatureText += "°F"
        }
        self.averageTemperature = averageTemperatureText
        
        self.pressure = "Pressure:   \(weather.pressure)"
        self.humidity = "Humidity:   \(weather.humidity)%"
        
        self.desc = weather.weather.count > 0 ? "Description:   \(weather.weather[0].description)" : ""
        
        self.unit = unit
    }
    
    deinit {
        // doing stuff here whether controller is being deinitialized
        
        NSLog("deinit WeatherViewModel")
    }
    
    func setupWeatherViewModels() {
        self.reloadDataForTableView?()
    }
}
