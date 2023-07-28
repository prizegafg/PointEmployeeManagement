//
//  MenuEntity.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 28/07/23.
//

import Foundation

struct MenuModel{
    var email: String?
    var userName: String?
    
    init(email: String? = nil, userName: String? = nil) {
        self.email = email
        self.userName = userName
    }
}
