//
//  Temperature.swift
//  EvaluationTest
//
//  Created by Inglab on 08/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import Foundation

class Temperature: Decodable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double
    var unit: String?
}
