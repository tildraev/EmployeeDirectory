//
//  EmployeeListViewModel.swift
//  EmployeeDirectory
//
//  Created by Arian Mohajer on 12/15/22.
//

import Foundation

protocol EmployeeListViewModelDelegate: EmployeeListTableViewController {
    func didEndRefreshing()
}

class EmployeeListViewModel {
    
    let dataProvider: DataProvider
    var topLevelDictionary: TopLevelDictionary?
    weak var delegate: EmployeeListViewModelDelegate?
    
    init() {
        dataProvider = DataProvider()
        initiateNetworkCall()
    }
    
    private func initiateNetworkCall() {
        guard let url = URL(string: DataProvider.urlString) else { return }
        dataProvider.fetch(from: url) { result in
            switch result {
            case .success(let topLevelDictionary):
                self.topLevelDictionary = topLevelDictionary
                self.delegate?.didEndRefreshing()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension EmployeeListViewModel: EmployeeListTableViewControllerDelegate {
    func didRequestRefresh() {
        initiateNetworkCall()
    }
}
