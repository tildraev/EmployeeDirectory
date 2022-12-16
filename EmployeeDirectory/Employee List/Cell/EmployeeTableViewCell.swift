//
//  EmployeeTableViewCell.swift
//  EmployeeDirectory
//
//  Created by Arian Mohajer on 12/15/22.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var employeeImageView: AsyncImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailAddressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    var employee: Employee?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        employee = nil
        employeeImageView.image = UIImage(named: "camera")
        nameLabel.text = ""
        teamLabel.text = ""
        phoneNumberLabel.text = ""
        emailAddressLabel.text = ""
        descriptionLabel.text = ""
    }
    
    func configure() {
        guard let employee = employee else { return }
        nameLabel.text = employee.fullName
        teamLabel.text = "Team: \(employee.team)"
        phoneNumberLabel.isHidden = (employee.phoneNumber == nil)
        descriptionLabel.isHidden = (employee.biography == nil)
        phoneNumberLabel.text = "Phone: \(formatPhoneNumber(number: employee.phoneNumber))"
        emailAddressLabel.text = "Email: \(employee.emailAddress)"
        descriptionLabel.text = employee.biography ?? ""
        
        if let largeImage = employee.photoURLLarge {
            self.employeeImageView.setImage(using: largeImage, from: employee.uuid)
        } else if let smallImage = employee.photoURLSmall {
            self.employeeImageView.setImage(using: smallImage, from: employee.uuid)
        } else {
            self.employeeImageView.image = UIImage(named: "camera")
        }   
    }
    
    func formatPhoneNumber(number: String?) -> String {
        guard let number = number else {
            return ""
        }
        
        var formattedNumber = number
        formattedNumber.insert("(", at: number.startIndex)
        formattedNumber.insert(")", at: number.index(number.startIndex, offsetBy: 4))
        formattedNumber.insert(" ", at: number.index(number.startIndex, offsetBy: 5))
        formattedNumber.insert("-", at: number.index(number.startIndex, offsetBy: 9))
//        welcome.insert("!", at: welcome.index(welcome.startIndex, offsetBy: 3))
        return formattedNumber
    }
}
