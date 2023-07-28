//
//  Alert.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation
import UIKit

class Alert {
    static func showAlert(
        title: String?,
        message: String?,
        actions: [UIAlertAction],
        on viewController: UIViewController
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in actions {
            alert.addAction(action)
        }
        
        viewController.present(alert, animated: true, completion: nil)
    }
}

