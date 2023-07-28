//
//  NavigationBar.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation
import UIKit

class NavigationBar: UINavigationBar {
    // MARK: - Properties
    
    private let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textAlignment = .center
            return label
        }()
        
        // Override the initializer to set up the custom navigation bar
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupNavigationBar()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupNavigationBar()
        }
        
        private func setupNavigationBar() {
            // Set the background color, tint color, or other properties as needed
            // Customize other aspects of the navigation bar if required
            
            // Add the title label to the navigation bar
            addSubview(titleLabel)
            
            // Constraints for the title label
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16).isActive = true
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -16).isActive = true
        }
        
        // Function to set the title text for the navigation bar
        func setTitle(_ title: String?) {
            titleLabel.text = title
        }
    }
    
