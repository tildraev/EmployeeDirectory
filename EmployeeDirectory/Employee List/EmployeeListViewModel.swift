//
//  EmployeeListViewModel.swift
//  EmployeeDirectory
//
//  Created by Arian Mohajer on 12/15/22.
//

import Foundation

protocol EmployeeListViewModelDelegate: EmployeeListTableViewController {}

class EmployeeListViewModel {
    
    let dataProvider: DataProvider
    var topLevelDictionary: TopLevelDictionary?
    weak var delegate: EmployeeListViewModelDelegate?
    
    init() {
        dataProvider = DataProvider()
        initiateNetworkCall()
    }
    
    private func initiateNetworkCall(fromRefresh: Bool = false) {
        guard let url = URL(string: DataProvider.urlString) else { return }
        dataProvider.fetch(from: url) { result in
            switch result {
            case .success(let topLevelDictionary):
                self.topLevelDictionary = topLevelDictionary
                if fromRefresh {
                    DispatchQueue.main.async {
                        self.delegate?.refreshControl?.endRefreshing()
                        self.delegate?.tableView.reloadData()
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension EmployeeListViewModel: EmployeeListTableViewControllerDelegate {
    func didRequestRefresh() {
        initiateNetworkCall(fromRefresh: true)
    }
}
