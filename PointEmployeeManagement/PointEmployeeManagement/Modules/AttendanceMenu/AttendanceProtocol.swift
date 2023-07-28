//
//  AttendanceProtocol.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 29/07/23.
//

import Foundation
import UIKit


protocol PTVAttendanceProtocol: AnyObject {}

protocol VTPAttendanceProtocol: AnyObject {
    var view: PTVAttendanceProtocol? {get set}
    var interactor: PTIAttendanceProtocol? {get set}
    var router: PTRAttendanceProtocol? {get set}
    
    func presence(data: AttendanceModel, nav: UINavigationController)
    func goToMenu(data: AttendanceModel, nav: UINavigationController)
}

protocol PTRAttendanceProtocol: AnyObject {
    static func createMainAttendanceModule() -> AttendanceVC
    func goToMenu(data:AttendanceModel, nav: UINavigationController)
    
}

protocol PTIAttendanceProtocol: AnyObject {
    var presenter: ITPAttendanceProtocol? {get set}
    func submitPresence(data: AttendanceModel, nav: UINavigationController)
}

protocol ITPAttendanceProtocol: AnyObject {}
