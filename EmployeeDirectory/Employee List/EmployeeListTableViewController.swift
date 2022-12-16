//
//  EmployeeListTableViewController.swift
//  EmployeeDirectory
//
//  Created by Arian Mohajer on 12/15/22.
//

import UIKit

protocol EmployeeListTableViewControllerDelegate: EmployeeListViewModel {
    func didRequestRefresh()
}

class EmployeeListTableViewController: UITableViewController {

    var viewModel: EmployeeListViewModel
    weak var delegate: EmployeeListTableViewControllerDelegate?
    
    override init(nibName: String?, bundle: Bundle?) {
        self.viewModel = EmployeeListViewModel()
        super.init(nibName: nibName, bundle: bundle)
        self.viewModel.delegate = self
        self.delegate = viewModel
        setupRefreshControl()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Helper Methods
    private func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        tableView.register(UINib(nibName: "EmployeeTableViewCell", bundle: nil), forCellReuseIdentifier: "EmployeeCell")
        refreshControl?.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl?.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl!)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        delegate?.didRequestRefresh()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.topLevelDictionary?.employees.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as? EmployeeTableViewCell else { return UITableViewCell() }

        cell.employee = viewModel.topLevelDictionary?.employees[indexPath.row]
        cell.configure()

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension EmployeeListTableViewController: EmployeeListViewModelDelegate {
    func didEndRefreshing() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
}
