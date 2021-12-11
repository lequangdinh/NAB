//
//  ViewModel.swift
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2019 Inglab. All rights reserved.
//

import Foundation

class ViewModel {
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
