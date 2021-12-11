//
//  Weather.swift
//  EvaluationTest
//
//  Created by Inglab on 08/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import Foundation

class Weather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}
