//
//  WeatherListViewController.swift
//  EvaluationTest
//
//  Created by Inglab on 11/12/2021.
//  Copyright © 2021 Inglab. All rights reserved.
//

import UIKit


class WeatherListViewController: ViewController<WeatherListViewModel>{

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Variables
    
    private var weatherListDataSource: WeatherListDataSource!

    private lazy var weatherListViewModel: WeatherListViewModel = { [weak self] in
        guard let `self` = self else {
            return WeatherListViewModel()
        }
        return WeatherListViewModel()
    }()
    
    deinit {
        // doing stuff here whether controller is being deinitialized
        NSLog("deinit WeatherListViewController")
    }
    
    override func bind() {
        self.title = NSLocalizedString("WeatherListViewController_Title", comment: "")
        setupTableView()
        setupData()
    }
    
    private func setupTableView() {
            weatherListDataSource = WeatherListDataSource(vcSelf: self, viewModel: weatherListViewModel)
            tableView.dataSource = weatherListDataSource
            tableView.delegate = weatherListDataSource
            tableView.tableFooterView = UIView()
            tableView.backgroundColor = .white
            tableView.register(UINib(nibName: WeatherTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.identifier)
            tableView.rowHeight = UITableView.automaticDimension
            tableView.separatorStyle = .none
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    private func setupData() {
        weatherListViewModel.reloadDataForTableView = { [weak self] in
            guard let `self` = self else { return }
            self.tableView.reloadData()
        }
    }
    
    private func removeAllData() {
        weatherListViewModel.removeAll()
        self.searchBar.searchTextField.resignFirstResponder()
    }
}

extension WeatherListViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.searchTextField.resignFirstResponder()
        if let text = searchBar.text {
            if text.count >= 3 {
                weatherListViewModel.setupWeatherViewModels(query: searchBar.text!, count: DEFAULT_COUNT, unit: DEFAULT_UNIT)
            } else {
                Helpers.sharedInstance.showAlert(message: NSLocalizedString("ShortNameError", comment: ""))
                self.removeAllData()
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.removeAllData()
    }
}
