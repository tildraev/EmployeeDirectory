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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure() {
        guard let employee = employee else { return }
        nameLabel.text = employee.fullName
        teamLabel.text = "Team: \(employee.team)"
        phoneNumberLabel.isHidden = (employee.phoneNumber == nil)
        descriptionLabel.isHidden = (employee.biography == nil)
        phoneNumberLabel.text = "Phone: \(employee.phoneNumber ?? "")"
        emailAddressLabel.text = "Email: \(employee.emailAddress)"
        descriptionLabel.text = employee.biography ?? ""
        
        if let largeImage = employee.photoURLLarge {
            employeeImageView.setImage(using: largeImage)
        } else if let smallImage = employee.photoURLSmall {
            employeeImageView.setImage(using: smallImage)
        } else {
            employeeImageView.image = UIImage(named: "camera")
        }
    }
    
}
