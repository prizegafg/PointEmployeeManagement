//
//  MenuProtocol.swift
//  PointEmployeeManagement
//
//  Created by Prizega  on 28/07/23.
//

import Foundation
import UIKit


protocol PTVMenuProtocol: AnyObject {}

protocol VTPMenuProtocol: AnyObject {
    var view: PTVMenuProtocol? {get set}
    var interactor: PTIMenuProtocol? {get set}
    var router: PTRMenuProtocol? {get set}
    
    func navToChangeData(data: MenuModel, nav: UINavigationController)
    func navToAttendance(data: MenuModel, nav: UINavigationController)
}

protocol PTRMenuProtocol: AnyObject {
    static func createMainMenuModule() -> MenuVC
    func goToChangeData(data: MenuModel, nav: UINavigationController)
    func goToAttendance(data: MenuModel, nav: UINavigationController)
    
}

protocol PTIMenuProtocol: AnyObject {
    var presenter: ITPMenuProtocol? {get set}
}

protocol ITPMenuProtocol: AnyObject {}


