//
//  ViewController.swift
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2019 Inglab. All rights reserved.
//

import UIKit

class ViewController<T: ViewModel>: UIViewController {
    
    var viewModel: T!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.bind()
        }
    }
    
    func bind() {
        preconditionFailure("This function must be overriden")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
