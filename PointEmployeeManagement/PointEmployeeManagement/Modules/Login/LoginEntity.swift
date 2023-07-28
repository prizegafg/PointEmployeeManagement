//
//  LoginEntity.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 26/07/23.
//

import Foundation

struct LoginModel {
    var username: String?
    var password: String?
    
    init(username: String? = nil, password: String? = nil) {
        self.username = username
        self.password = password
    }
}
