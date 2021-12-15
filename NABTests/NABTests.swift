//
//  NABTests.swift
//  NABTests
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import XCTest
@testable import NAB

class NABTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvertingTimeStampToString() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let date = DateUtils.convertTimeStampToDate(1639195200)
        XCTAssertEqual(date, "Sat, 11 Dec 2021")
    }
    
    func testGettingWeatherList() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // test API CALL
        let weatherExpectation = expectation(description: "weather")
        var weatherForecastList : [DateForecast]?
        var viewModel : WeatherViewModel?
        GetWeatherListRequest.getWeatherList(query: "saigon", count:DEFAULT_COUNT, unit: DEFAULT_UNIT, success: {(result, errorCode) in
            weatherForecastList = result[RESPONSE_RESULTS] as? [DateForecast]
            
            if let value = weatherForecastList {
                let weatherViewModels = value.map {(model) -> WeatherViewModel in
                    let weatherViewModel = WeatherViewModel(weather: model, unit: DEFAULT_UNIT)
                    return weatherViewModel
                }
                
                if weatherViewModels.count > 0 {
                    // test WeatherViewModel
                    viewModel = weatherViewModels[0]
                }
            }
            
            weatherExpectation.fulfill()
        }, failure: { (result, errorCode) in
            weatherExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 1) {(error) in
            XCTAssertNotNil(weatherForecastList)
            XCTAssertNotNil(viewModel)
            XCTAssertEqual(viewModel!.averageTemperature, "Average Tempurature:   28°C")
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
