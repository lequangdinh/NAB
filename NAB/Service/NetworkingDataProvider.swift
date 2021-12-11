//
//  NetworkingDataProvider.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//


class NetworkingDataProvider : DataProvider {
    func getWeatherList(query: String, count: Int, unit: Unit, success: @escaping SuccessCallback, failure: @escaping FailureCallback) {
        GetWeatherListRequest.getWeatherList(query: query, count: count, unit: unit, success: success, failure: failure)
    }
}
