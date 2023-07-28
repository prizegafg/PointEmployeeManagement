//
//  ForgotPasswordEntity.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation

struct ForgotPasswordModel{
    var email : String?
    var password : String?
    
    init(email: String? = nil, password: String? = nil) {
        self.email = email
        self.password = password
    }
}
