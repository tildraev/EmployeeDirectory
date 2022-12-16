//
//  EmployeeListViewModel.swift
//  EmployeeDirectory
//
//  Created by Arian Mohajer on 12/15/22.
//

import Foundation

protocol EmployeeListViewModelDelegate: EmployeeListTableViewController {
    func displayAlert(with error: Error)
}

class EmployeeListViewModel {
    
    let dataProvider: DataProvider
    var topLevelDictionary: TopLevelDictionary?
    weak var delegate: EmployeeListViewModelDelegate?
    var urlToUse: String = DataProvider.workingURLString
    
    init() {
        dataProvider = DataProvider()
        initiateNetworkCall(urlString: urlToUse, completion: nil)
    }
    
    func initiateNetworkCall(urlString: String, fromRefresh: Bool = false, completion: (() -> Void)?) {
        dataProvider.fetch(from: urlString) { result in
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
                DispatchQueue.main.async {
                    self.delegate?.displayAlert(with: error)                    
                }
            }
        }
    }
}

extension EmployeeListViewModel: EmployeeListTableViewControllerDelegate {
    func didRequestRefresh() {
        initiateNetworkCall(urlString: urlToUse, fromRefresh: true, completion: nil)
    }
}
