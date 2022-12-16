//
//  DataProvider.swift
//  EmployeeDirectory
//
//  Created by Arian Mohajer on 12/15/22.
//

import Foundation

protocol DataProvidable {
    func fetch(from urlString: String, completion: @escaping (Result<TopLevelDictionary, NetworkError>) -> Void)
}

struct DataProvider: APIDataProvidable, DataProvidable {
    
    static var urlString: String = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    
    func fetch(from urlString: String, completion: @escaping (Result<TopLevelDictionary, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL(urlString)))
            return
        }
        
        let request = URLRequest(url: url)
        perform(request) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.unableToDecode))
                }
            case .failure(let error):
                completion(.failure(.thrownError(error)))
            }
        }
    }
}


/*
 We have provided an endpoint, which when called, returns a dictionary containing a JSON array, containing employee information for a fictitious list of employees. Each item in the array represents an employee.

 https://s3.amazonaws.com/sq-mobile-interview/employees.json
 There are also other endpoints you can call to simulate error states such as malformed employees, and an empty employee list:

 https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json
 https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json
 If any employee is malformed, it is fine to invalidate the entire list of employees in the response - there is no need to exclude only malformed employees.

 If there are no employees to show, the app should present an empty state view instead of an empty list.

 There is no pagination API - the endpoint returns the full list of employees. The endpoint is also not authenticated.
 */
