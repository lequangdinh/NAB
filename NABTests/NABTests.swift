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
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
