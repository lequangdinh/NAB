//
//  TableViewCell.swift
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2019 Inglab. All rights reserved.
//


import UIKit

class TableViewCell<T: ViewModel>: UITableViewCell {
    
    var viewModel: T! {
        didSet {
            bind()
        }
    }
    
    func bind() {
        preconditionFailure("This function must be overriden")
    }
}
