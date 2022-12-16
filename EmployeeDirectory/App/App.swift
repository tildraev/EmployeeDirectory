//
//  Cache.swift
//  EmployeeDirectory
//
//  Created by Arian Mohajer on 12/15/22.
//

import Foundation
import UIKit

class App {
    public static var shared: App = App()
    var imageCache: NSCache<NSString, UIImage> = NSCache()
    
    init() {}
}
