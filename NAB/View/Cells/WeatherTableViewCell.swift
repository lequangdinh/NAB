//
//  WeatherTableViewCell.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import UIKit

class WeatherTableViewCell: TableViewCell<WeatherViewModel> {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var averageTempLabel: UILabel!
    
    @IBOutlet weak var pressureLabel: UILabel!
    
    @IBOutlet weak var humidityLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet private weak var bottomView: UIView!

    
    // MARK: - Variables
    static let identifier = "WeatherTableViewCell"
    
    
    override func bind() {
        self.dateLabel.text = viewModel.date
        self.averageTempLabel.text = viewModel.averageTemperature
          self.pressureLabel.text = viewModel.pressure
          self.humidityLabel.text = viewModel.humidity
          self.descriptionLabel.text = viewModel.desc
    }
    
    // MARK: - View Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    deinit {
        // doing stuff here whether controller is being deinitialized
        NSLog("deinit WeatherTableViewCell")
    }
}

