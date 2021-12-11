//
//  WeatherListViewModel.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import UIKit

class WeatherListViewModel : ViewModel{
    
    // MARK: - Variables
    var weatherViewModels: [WeatherViewModel] = []
    let dataProvider: DataProvider = NetworkingDataProvider()
    
    // MARK: - Closures
    var reloadDataForTableView: (()->())?
    
    
    deinit {
        // doing stuff here whether controller is being deinitialized
        NSLog("deinit WeatherListViewModel")
    }
    
    
    func removeAll() {
        self.weatherViewModels.removeAll()
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            self.reloadDataForTableView?()
        }
    }
    
    func setupWeatherViewModels(query: String, count:Int, unit: Unit) {
        dataProvider.getWeatherList(query: query, count:count, unit: unit, success: { (result, errorCode) in
            let weatherList = result[RESPONSE_RESULTS] as! [DateForecast]
            
            self.weatherViewModels = weatherList.map { (model) -> WeatherViewModel in
                let weatherViewModel = WeatherViewModel(weather: model, unit: unit)
                return weatherViewModel
            }
            
            DispatchQueue.main.async { [weak self] in
                guard let `self` = self else { return }
                self.reloadDataForTableView?()
            }
            
            if (weatherList.count == 0) {
                DispatchQueue.main.async {
                    Helpers.sharedInstance.showAlert(message: NSLocalizedString("UnknownError", comment: ""))
                }
            }
            
        }, failure: { (result, errorCode) in
            switch errorCode {
            case NOT_FOUND_STATUS_CODE:
                self.removeAll()
                Helpers.sharedInstance.showAlert(message: NSLocalizedString("CityNotFoundError", comment: ""))
            default:
                Helpers.sharedInstance.showAlert(message: NSLocalizedString("NoData", comment: ""))
            }
        })
    }
    
    
}
