//
//  LoginInteractor.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth

class LoginInteractor: PTILoginProtocol{
    var presenter: ITPLoginProtocol?
    
    func fetchLogin(data: LoginModel, nav: UINavigationController) {
        
        Auth.auth().signIn(withEmail: data.username!, password: data.password!) { [weak self] authResult, error in
            if let error = error {
                // Handle registration error
                self?.presenter?.onFailedLogin(error: Error.errorToString(error)())
            } else if let user = authResult?.user {
                // Registration successful
                self?.presenter?.onSucessLogin()
            }
        }
    }
    
}
