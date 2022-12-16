//
//  EmptyUIView.swift
//  EmployeeDirectory
//
//  Created by Arian Mohajer on 12/15/22.
//

import UIKit

class EmptyUIView: UIView {

    let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "No employees found"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(emptyLabel)
        NSLayoutConstraint.activate([
            emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
