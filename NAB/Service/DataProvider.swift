//
//  WeatherProvider.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import Foundation

protocol DataProvider {
    func getWeatherList(query: String, count: Int, unit: Unit, success: @escaping SuccessCallback, failure: @escaping FailureCallback)
    
    // get weather detail
    
    // add new weather
    
    // remove weather
}
