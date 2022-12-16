//
//  EmployeeDirectoryTests.swift
//  EmployeeDirectoryTests
//
//  Created by Arian Mohajer on 12/15/22.
//

import XCTest
@testable import EmployeeDirectory

class EmployeeDirectoryTests: XCTestCase {

    var employeeListViewModel: EmployeeListViewModel!
    
    override func setUp() {
        employeeListViewModel = EmployeeListViewModel()
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        employeeListViewModel = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEmployeeListNetworkCall() {
        employeeListViewModel.initiateNetworkCall(urlString: DataProvider.urlString, completion: {
            XCTAssertNotNil(self.employeeListViewModel.topLevelDictionary)
        })
    }
    
    func testEmployeeListNetworkCallNotEmpty() {
        employeeListViewModel.initiateNetworkCall(urlString: DataProvider.urlString, completion: {
            if let employeeList = self.employeeListViewModel.topLevelDictionary?.employees {
                XCTAssertTrue(!employeeList.isEmpty)
            }
        })
    }
    
    func testEmptyNetworkCall() {
        employeeListViewModel.initiateNetworkCall(urlString: DataProvider.emptyURLString, completion: {
            XCTAssertNil(self.employeeListViewModel.topLevelDictionary)
        })
    }
    
    func testMalformedNetworkCall() {
        employeeListViewModel.initiateNetworkCall(urlString: DataProvider.malformedURLString, completion: {
            if let employeeList = self.employeeListViewModel.topLevelDictionary?.employees {
                XCTAssertTrue(employeeList.isEmpty)
            }
        })
    }

}
