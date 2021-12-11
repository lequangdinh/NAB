//
//  DateUtils.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import Foundation

class DateUtils {
    static func convertTimeStampToDate(_ timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: Double(timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
        return dateFormatter.string(from: date) 
    }
    
}

