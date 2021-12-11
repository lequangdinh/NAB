//
//  Helpers.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import UIKit

class Helpers {
    static let sharedInstance = Helpers()
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        var rootViewController = UIApplication.shared.windows.first!.rootViewController
        if let navigationController = rootViewController as? UINavigationController {
            rootViewController = navigationController.viewControllers.first
        }
        
        DispatchQueue.main.async {
            rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

