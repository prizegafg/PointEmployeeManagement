//
//  ForgotPasswordInteractor.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation
import UIKit
import FirebaseAuth

class ForgotPasswordInteractor: PTIForgotPasswordProtocol{
    var presenter: ITPForgotPasswordProtocol?
    
    func fetchForgotPassword(data: ForgotPasswordModel, nav: UINavigationController) {
        Auth.auth().sendPasswordReset(withEmail: data.email!) { error in
                if let error = error {
                    let errorHandle = Error.errorToString(error)
                    print(error.localizedDescription)
                    self.presenter?.onFailedRegis(error: errorHandle())
                } else {
                    self.presenter?.onSuccessRegis()
                }
            }
    }
    
    
}
