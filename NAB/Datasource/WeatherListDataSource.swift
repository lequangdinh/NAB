//
//  WeatherListDataSource.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import UIKit

// MARK: - WeatherListDataSource
class WeatherListDataSource: NSObject {
    
    // MARK: - Variables
    private var weatherListViewModel: WeatherListViewModel!
    private weak var vcSelf: WeatherListViewController?

    
    // MARK: - Initialization
    init(vcSelf: WeatherListViewController?, viewModel: WeatherListViewModel) {
        self.vcSelf = vcSelf
        self.weatherListViewModel = viewModel
    }
    
    deinit {
        // doing stuff here whether controller is being deinitialized
        
        NSLog("deinit WeatherListDataSource")
    }
}

// MARK: - UITableViewDataSource
extension WeatherListDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return WEATHER_TABLE_VIEW_CELL_HEIGHT
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell {
            cell.selectionStyle = .none
            let item = weatherListViewModel.weatherViewModels[indexPath.row]
            cell.viewModel = item
            return cell
        }
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension WeatherListDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

