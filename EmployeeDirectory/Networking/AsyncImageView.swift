//
//  AsyncImageView.swift
//  EmployeeDirectory
//
//  Created by Arian Mohajer on 12/15/22.
//

import Foundation
import UIKit

class AsyncImageView: UIImageView, APIDataProvidable {
    
    func setImage(using imagePath: String, from employeeUUID: String) {
        guard let baseURL = URL(string: imagePath) else { return }
        let urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        guard let finalURL = urlComponents?.url else { return }
        
        perform(URLRequest(url: finalURL)) { [weak self] result in
            DispatchQueue.main.async {
                guard let imageData = try? result.get(),
                      let employeeImage = UIImage(data: imageData) else { return }
                App.shared.imageCache.setObject(employeeImage, forKey: NSString(string: employeeUUID))
                self?.image = employeeImage
            }
            
        }
    }
}
