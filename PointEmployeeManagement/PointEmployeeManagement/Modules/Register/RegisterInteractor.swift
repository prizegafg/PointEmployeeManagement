//
//  RegisterInteractor.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class RegisterInteractor: PTIRegisterProtocol{
    var presenter: ITPRegisterProtocol?
    
    func fetchRegister(data: RegisModel, nav: UINavigationController) {
        Auth.auth().createUser(withEmail: data.email!, password: data.password!) { (authResult, error) in
                if let error = error {
                    let errorHandle = Error.errorToString(error)
                    self.presenter?.onFailedRegis(error: errorHandle())
                } else if let user = authResult?.user {
                    self.saveRegisData(data: data)
                    
                }
            }
    }
    
    func saveRegisData(data: RegisModel) {
        guard let user = Auth.auth().currentUser else {
                return
            }

            let userData: [String: Any] = [
                "firstName": data.firstName,
                "lastName": data.lastName,
                "username": data.userName,
                "email": data.email
                // Add more user data fields as needed
            ]

            let db = Firestore.firestore()
            db.collection("users").addDocument(data: userData) { error in
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
