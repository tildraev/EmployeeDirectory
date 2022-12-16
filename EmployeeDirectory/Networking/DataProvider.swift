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
    
    static var workingURLString: String = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    static var malformedURLString: String = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
    static var emptyURLString: String = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    
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
