//
//  GetWeatherListRequest.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import Foundation

class GetWeatherListRequest : NSObject {
    
    static let GET_WEATHER_LIST_URI: String = "/forecast/daily"

    static func getWeatherList(query: String, count: Int, unit: Unit, success: @escaping SuccessCallback, failure: @escaping FailureCallback) {
        
        var urlString = String(format: "%@%@?q=%@&cnt=%d&appId=%@&units=%@", WEATHER_FORECAST_API_PREFIX, GET_WEATHER_LIST_URI, query, count, APP_ID, unit.rawValue)
        
        urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        
        guard let serviceUrl = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: serviceUrl) {(data, response, error) in
            
            if let _ = error {
    
                failure(Dictionary(), UNKNOWN_ERROR)
                
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == SUCCESS_STATUS_CODE {
                    do {
                        let jsonDecoder = JSONDecoder()
                        
                        let decodedResponse = try jsonDecoder.decode(WeatherForecastResponse.self, from: data)
                        
                       // print(decodedResponse)
                        
                        var dic = Dictionary<String, Array<Any>>()
                        
                        dic[RESPONSE_RESULTS] = decodedResponse.list
                        success(dic, 0)
                        
                    } catch {
                        failure(Dictionary(), UNKNOWN_ERROR)
                    }
                } else {
                    
                    failure(Dictionary(), response.statusCode)
                    
                }
            }
        }
        
        task.resume()
    }
}
