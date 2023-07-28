//
//  AttendanceEntity.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 29/07/23.
//

import Foundation

struct AttendanceModel{
    var email: String?
    var userName: String?
    var langLat: String?
    
    init(email: String? = nil, userName: String? = nil) {
        self.email = email
        self.userName = userName
    }
}
