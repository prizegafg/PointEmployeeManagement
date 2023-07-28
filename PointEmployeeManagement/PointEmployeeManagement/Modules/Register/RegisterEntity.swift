//
//  RegisterEntity.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 27/07/23.
//

import Foundation

struct RegisModel{
    var firstName: String?
    var lastName: String?
    var userName: String?
    var email: String?
    var password: String?
    
    init(firstName: String? = nil, lastName: String? = nil, userName: String? = nil, email: String? = nil, password: String? = nil) {
        self.firstName = firstName
        self.lastName = lastName
        self.userName = userName
        self.email = email
        self.password = password
    }
    
    
}
